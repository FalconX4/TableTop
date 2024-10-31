bag_GUID = '74cb5a'
deckZone_GUID = 'f77a4a'
migoBraincase_GUID = '12150a'
dice_GUID = '5db4cb'
antiSpam = false

canine_GUID = '6aaf78'
insect_GUID = '97fee1'
avian_GUID = '514c51'
hooved_GUID = '760bd9'
reptile_GUID = '528364'
squirrel_GUID = '2ed751'
totems_GUID = { canine_GUID, insect_GUID, avian_GUID, hooved_GUID, reptile_GUID, squirrel_GUID }
totems_Player = { 'Red', 'Yellow', 'Green', 'Blue', 'Pink', 'Orange' }

canineFire_GUID = 'dcff8a'
insectFire_GUID = 'beb639'
avianFire_GUID = '7bac8f'
hoovedFire_GUID = 'c6cc06'
reptileFire_GUID = 'c7b6ea'
squirrelFire_GUID = '7672f0'
totemsFire_GUID = { canineFire_GUID, insectFire_GUID, avianFire_GUID, hoovedFire_GUID, reptileFire_GUID, squirrelFire_GUID }

function onload()
  migoBraincase = getObjectFromGUID(migoBraincase_GUID)
  bag = getObjectFromGUID(bag_GUID)
  deckZone = getObjectFromGUID(deckZone_GUID)
  dice = getObjectFromGUID(dice_GUID)
  
  totemsFire = {}
  for i=1, #totems_GUID do
    totemsFire[i] = getObjectFromGUID(totemsFire_GUID[i])
  end

  for i,object in ipairs(deckZone.getObjects()) do
    if (not isObjectException(object) and object.tag == "Deck") then
      deckDefaultPosition = object.getPosition()
      deckDefaultRotation = object.getRotation()
    end
  end

  migoBraincaseDefaultPosition = migoBraincase.getPosition()
  migoBraincaseDefaultRotation = migoBraincase.getRotation()
  
  diceDefaultPosition = dice.getPosition()
  diceDefaultRotation = dice.getRotation()
  
  bag.createButton({click_function = 'restart', label = "Restart", color = { 1, 0, 0 },
    position = {-2.0,0.1, 1.0}, rotation = {0,180,0}, width = 775, height = 300, font_size = 150
  })
  bag.createButton({click_function = 'peek', label = "Peek Card", color = { 0, 1, 0 },
    position = {0.5,0.1,5.0}, rotation = {0,180,0}, width = 1000, height = 300, font_size = 150
  })
  bag.createButton({click_function = 'peekEachOther', label = "Both Peek", color = { 0, 1, 1 },
    position = {-2.0,0.1,5.0}, rotation = {0,180,0}, width = 1000, height = 300, font_size = 150
  })
  bag.createButton({click_function = 'switch', label = "Switch Card", color = { 0, 0, 1 },
    position = {-4.5,0.1,5.0}, rotation = {0,180,0}, width = 1000, height = 300, font_size = 150
  })
  
  peeker = ""
  peekerEachOther = ""
  switcher = ""
  peekPressed = false
  peekEachOtherPressed = false
  switchPressed = false
end

function restart()
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  resetDice()
  resetMigo()
  resetCardsPosition()
  resetTotemsFire()
  Wait.time(function() shuffle() end, 0.5)
end

function resetDice()
  dice = getObjectFromGUID(dice_GUID)
  dice.setPosition(diceDefaultPosition)
  dice.setRotation(diceDefaultRotation)
end

function resetMigo()
  migoBraincase = getObjectFromGUID(migoBraincase_GUID)
  if (migoBraincase == nil) then
    local allObjects = getObjects()
    for i,object in ipairs(allObjects) do
      if (not isObjectException(object) and object.tag == "Deck") then
	    for j,objectDeck in ipairs(object.getObjects()) do
		  if (objectDeck.guid == migoBraincase_GUID) then
		    object.takeObject({ guid = migoBraincase_GUID, position = migoBraincaseDefaultPosition, rotation = migoBraincaseDefaultRotation })
		  end
		end
      end
    end
  else
    migoBraincase.setPosition(migoBraincaseDefaultPosition)
    migoBraincase.setRotation(migoBraincaseDefaultRotation)
  end
end

function resetCardsPosition()
  local allObjects = getObjects()
  for i,object in ipairs(allObjects) do
    if (not isObjectException(object) and (object.tag == "Card" or object.tag == "Deck")) then
      if (object.is_face_down) then
        object.flip()
      end
      object.setPosition(deckDefaultPosition)
      object.setRotation(deckDefaultRotation)
    end
  end
end

function resetTotemsFire()
  for i=1, #totems_Player do
    totemsFire[i].AssetBundle.playLoopingEffect(2)
  end

  local seatedPlayers = getSeatedPlayers()
  for _, player in ipairs(seatedPlayers) do
    for i=1, #totems_Player do
	  if (player == totems_Player[i]) then
	    changeFireState(totemsFire[i])
	  end
	end
  end
end

function isObjectException(object)
  if (object.guid == migoBraincase_GUID) then
    return true
  end
  return isHelpCard(object)
end

function isHelpCard(object)
  for i, tag in pairs(object.getTags()) do
    if (tag == "HelpCard") then
      return true
    end
  end
  return false
end

function shuffle()
  for i,object in ipairs(deckZone.getObjects()) do
    if (not isObjectException(object) and object.tag == "Deck") then
      deck = object;
    end
  end

  deck.shuffle()
  Wait.time(function() dealToAll() end, 0.5)
end

function dealToAll()
  deck.takeObject({ flip = false, position = { migoBraincaseDefaultPosition.x, migoBraincaseDefaultPosition.y - 0.01, migoBraincaseDefaultPosition.z }, rotation = { 180,90,0 }})
  local seatedPlayers = getSeatedPlayers()
  for _, player in ipairs(seatedPlayers) do
    dealTo(player, 1)
  end
end

function dealTo(player, number)
  print(player)
  local cardCount = 0
  local playerHand = Player[player].getHandObjects()
  for _, card in ipairs(playerHand) do
    if (not isHelpCard(card) and card.tag == "Card") then
       cardCount = cardCount + 1
    end
  end

  if (cardCount < number) then
    deck.deal(number - cardCount, player)
  end
end

function isObjectFaceup(object)
  rot = object.getRotation()
  if (rot.z < 90) or (rot.z > 270) then
    return true
  else
    return false
  end
end

function peek(object, player, alt)
  if (peekPressed) then
    return
  end

  if (peeker == "") then
    bag.editButton({ index = 1, label = Player[player].steam_name })
	peeker = player
    peekPressed = true
    Wait.time(function() peekPressed = false end, 1)
  else
    --bag.editButton({ index = 1, label = peeker .. " peeked at " .. player })
    --cardPeeked = giveCardTo(peeker, player)
    --Wait.time(function() endPeek() end, 10)
	broadcastPeekPlayerCard(peeker, player)
    peekPressed = true
	Wait.time(function() endPeek() end, 1)
  end
end

function endPeek()
  bag.editButton({ index = 1, label = "Peek Card" })
  --cardPeeked.deal(1, switcher)
  peeker = ""
  peekPressed = false
end

function peekEachOther(object, player, alt)
  if (peekEachOtherPressed) then
    return
  end

  if (peekerEachOther == "") then
    bag.editButton({ index = 2, label = Player[player].steam_name })
	peekerEachOther = player
    peekEachOtherPressed = true
    Wait.time(function() peekEachOtherPressed = false end, 1)
  else
    --bag.editButton({ index = 2, label = peekerEachOther .. " and " .. player .. "peeked each other" })
    --cardPeekedEachOther = giveCardTo(peekerEachOther, player)
    --Wait.time(function() endPeekEachOther() end, 10)
	broadcastPeekEachOtherPlayerCard(peekerEachOther, player)
    peekEachOtherPressed = true
	Wait.time(function() endPeekEachOther() end, 1)
  end
end

function endPeekEachOther()
  bag.editButton({ index = 2, label = "Both Peek" })
  --cardPeekedEachOther.deal(1, switcher)
  peekerEachOther = ""
  peekEachOtherPressed = false
end

function switch(object, player, alt)
  if (switchPressed)then
    return
  end

  if (switcher == "") then
    bag.editButton({ index = 3, label = Player[player].steam_name })
    switcher = player
    switchPressed = true
    Wait.time(function() switchPressed = false end, 1)
  else
    --bag.editButton({ index = 3, label = switcher .. " switched with " .. player })
    giveCardTo(switcher, player)
	giveCardTo(player, switcher)
	broadcastToAll(Player[switcher].steam_name .. " switched with ".. Player[player].steam_name, { 1, 1, 1 })
    switchPressed = true
    Wait.time(function() endSwitch() end, 1)
  end
end

function endSwitch()
  bag.editButton({ index = 3, label = "Switch Card" })
  switcher = ""
  switchPressed = false
end

function broadcastPeekPlayerCard(peeker, player)
  broadcastToColor(Player[player].steam_name .. " peeked at your card!", player, {1, 1, 1})
  broadcastPeekToAll(peeker, player)
  broadcastPeekTo(peeker, player)
end

function broadcastPeekEachOtherPlayerCard(peeker, player)
  broadcastPeekToAll(peeker, player)
  broadcastPeekToAll(player, peeker)
  broadcastPeekTo(player, peeker)
  broadcastPeekTo(peeker, player)
end

function broadcastPeekToAll(peeker, player)
  local seatedPlayers = getSeatedPlayers()
  for _, seatedPlayer in ipairs(seatedPlayers) do
    if (seatedPlayer != peeker or seatedPlayer != player) then
      broadcastToColor(Player[peeker].steam_name .. " peeked at " .. Player[player].steam_name .. " card!", seatedPlayer, {1, 1, 1})
	end
  end
end

function broadcastPeekTo(peeker, player)
  local playerHand = Player[player].getHandObjects()
  for _, card in ipairs(playerHand) do
    if (not isHelpCard(card) and card.tag == "Card") then
       broadcastToColor("You saw a " .. card.getName() .. " from " .. Player[player].steam_name, peeker, {1, 1, 1})
	   return card
    end
  end
end

function giveCardTo(from, to)
  local fromHand = Player[from].getHandObjects()
  for _, card in ipairs(fromHand) do
    if (not isHelpCard(card) and card.tag == "Card") then
       card.Deal(1, to)
	   return card
    end
  end
end

function onPlayerAction(player, action, targets)
  if (action == Player.Action.Select) then
    for _, target in ipairs(targets) do
	  local targetGUID = target.getGUID()
	  for i=1, #totems_GUID do
        if (targetGUID == totems_GUID[i]) then
		  changeFireState(totemsFire[i])
		  return false
        end
	  end
    end
  end

  return true
end

function changeFireState(fire)
  if (fire.AssetBundle.getLoopingEffectIndex() == 1) then
    fire.AssetBundle.playLoopingEffect(2)
  else
    fire.AssetBundle.playLoopingEffect(1)
  end
end