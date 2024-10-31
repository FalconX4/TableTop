player1 = 'Orange'
player2 = 'Green'
players = { player1, player2 }
playerWon = 0

buttonReset_GUID = '7c5aae'
buttonSetup_GUID = '9416ae'
buttonMarket_GUID = '88205f'
buttonClean_GUID = 'b94b09'

deckZone_GUID = '803245'
discardZone_GUID = 'f8857e'

setupZone1_GUID = '26a281'
setupZone2_GUID = 'cbfb10'
setupZone3_GUID = '3fdc64'
setupZone4_GUID = '9ebf25'

setupZone1Button_GUID = 'b6a19b'
setupZone2Button_GUID = '73f239'
setupZone3Button_GUID = '19df93'
setupZone4Button_GUID = 'ac6bcf'

marketZoneTop_GUID = '4423a9'
marketZoneBottom_GUID = 'c09dbb'

playZone1_GUID = 'abbdbe'
playZone2_GUID = 'ef9519'
exhaustZone1_GUID = '147de9'
exhaustZone2_GUID = '1fc13e'

player1CoinsText_GUID = '4ddeaa'
player2CoinsText_GUID = 'cf76f6'
player1WinsText_GUID = '4e102b'
player2WinsText_GUID = '288316'
player1CoinsZone_GUID = '9893dd'
player2CoinsZone_GUID = '39fef0'
player1WinsZone_GUID = '7ba58c'
player2WinsZone_GUID = '87f38d'
player1ExhaustText_GUID = 'ccfd6a'
player2ExhaustText_GUID = '50771f'
player1HandZone_GUID = 'e3c232'
player2HandZone_GUID = '1eb387'
player1HandText_GUID = '9c2d06'
player2HandText_GUID = 'c512d2'

addCoin_GUID = '12b46d'
removeCoin_GUID = '513975'
flag_GUID = '4ee3a7'

function onload()
  buttonReset = getObjectFromGUID(buttonReset_GUID)
  buttonSetup = getObjectFromGUID(buttonSetup_GUID)
  buttonMarket = getObjectFromGUID(buttonMarket_GUID)
  buttonClean = getObjectFromGUID(buttonClean_GUID)
  deckZone = getObjectFromGUID(deckZone_GUID)
  discardZone = getObjectFromGUID(discardZone_GUID)
  setupZone1 = getObjectFromGUID(setupZone1_GUID)
  setupZone2 = getObjectFromGUID(setupZone2_GUID)
  setupZone3 = getObjectFromGUID(setupZone3_GUID)
  setupZone4 = getObjectFromGUID(setupZone4_GUID)
  setupZone1Button = getObjectFromGUID(setupZone1Button_GUID)
  setupZone2Button = getObjectFromGUID(setupZone2Button_GUID)
  setupZone3Button = getObjectFromGUID(setupZone3Button_GUID)
  setupZone4Button = getObjectFromGUID(setupZone4Button_GUID)
  marketZoneTop = getObjectFromGUID(marketZoneTop_GUID)
  marketZoneBottom = getObjectFromGUID(marketZoneBottom_GUID)
  playZone1 = getObjectFromGUID(playZone1_GUID)
  playZone2 = getObjectFromGUID(playZone2_GUID)
  exhaustZone1 = getObjectFromGUID(exhaustZone1_GUID)
  exhaustZone2 = getObjectFromGUID(exhaustZone2_GUID)
  player1ExhaustText = getObjectFromGUID(player1ExhaustText_GUID)
  player2ExhaustText = getObjectFromGUID(player2ExhaustText_GUID)
  player1CoinsText = getObjectFromGUID(player1CoinsText_GUID)
  player2CoinsText = getObjectFromGUID(player2CoinsText_GUID)
  player1WinsText = getObjectFromGUID(player1WinsText_GUID)
  player2WinsText = getObjectFromGUID(player2WinsText_GUID)
  player1CoinsZone = getObjectFromGUID(player1CoinsZone_GUID)
  player2CoinsZone = getObjectFromGUID(player2CoinsZone_GUID)
  player1WinsZone = getObjectFromGUID(player1WinsZone_GUID)
  player2WinsZone = getObjectFromGUID(player2WinsZone_GUID)
  player1HandZone = getObjectFromGUID(player1HandZone_GUID)
  player2HandZone = getObjectFromGUID(player2HandZone_GUID)
  player1HandText = getObjectFromGUID(player1HandText_GUID)
  player2HandText = getObjectFromGUID(player2HandText_GUID)
  addCoin = getObjectFromGUID(addCoin_GUID)
  removeCoin = getObjectFromGUID(removeCoin_GUID)
  flag = getObjectFromGUID(flag_GUID)

  buttonSetup.createButton({click_function = 'setup', label = "Setup", color = { 0, 1, 0 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
  })
  buttonReset.createButton({click_function = 'reset', label = "Reset", color = { 1, 0, 0 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
  })
  
  buttonMarket.setInvisibleTo(players)
  buttonClean.setInvisibleTo(players)
  setupZone1Button.setInvisibleTo(players)
  setupZone2Button.setInvisibleTo(players)
  setupZone3Button.setInvisibleTo(players)
  setupZone4Button.setInvisibleTo(players)
  addCoin.setInvisibleTo(players)
  removeCoin.setInvisibleTo(players)

  flagDefaultPosition = flag.getPosition()
  done = 0
  antiSpam = false
end

function reset()
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  buttonSetup.clearButtons()
  buttonSetup.setInvisibleTo()
  buttonSetup.createButton({click_function = 'setup', label = "Setup", color = { 0, 1, 0 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
  })

  buttonMarket.setInvisibleTo(players)
  buttonClean.setInvisibleTo(players)
  setupZone1Button.setInvisibleTo(players)
  setupZone2Button.setInvisibleTo(players)
  setupZone3Button.setInvisibleTo(players)
  setupZone4Button.setInvisibleTo(players)
  addCoin.setInvisibleTo(players)
  removeCoin.setInvisibleTo(players)
  buttonMarket.clearButtons()
  buttonClean.clearButtons()
  setupZone1Button.clearButtons()
  setupZone2Button.clearButtons()
  setupZone3Button.clearButtons()
  setupZone4Button.clearButtons()
  addCoin.clearButtons()
  removeCoin.clearButtons()

  flag.setPositionSmooth(flagDefaultPosition, false, true)
  playerWon = 0
  done = 0

  local allObjects = getObjects()
  for i,object in ipairs(allObjects) do
    if (object != clonedDeck and object != flag and (object.tag == "Card" or object.tag == "Deck")) then
      destroyObject(object)
    end
  end

  clonedDeck.clone({ position = deckZone.getPosition() })
  destroyObject(clonedDeck)
end

function setup()
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  if (done == 2) then
    moveMarket(setupZone1)
    moveMarket(setupZone3)
    moveMarket(setupZone4)
    fillZone(marketZoneBottom)
    buttonSetup.clearButtons()
    buttonSetup.setInvisibleTo(players)
    addCoin.setInvisibleTo()
    removeCoin.setInvisibleTo()
    setupZone1Button.clearButtons()
    setupZone2Button.clearButtons()
    setupZone3Button.clearButtons()
    setupZone4Button.clearButtons()
    setupZone1Button.setInvisibleTo(players)
    setupZone2Button.setInvisibleTo(players)
    setupZone3Button.setInvisibleTo(players)
    setupZone4Button.setInvisibleTo(players)
    addCoin.createButton({click_function = 'gainCoin', label = "Gain Gold", color = { 0, 1, 0 },
      position = {0.0, 0.4, 0.0}, rotation = {0, 0, 0}, width = 3000, height = 1200, font_size = 600
    })
    removeCoin.createButton({click_function = 'spendCoin', label = "Spend Gold", color = { 1, 0, 0 },
      position = {0.0, 0.4, 0.0}, rotation = {0, 0, 0}, width = 3000, height = 1200, font_size = 600
    })
    Wait.time(function() checkRoundWinCondition() end, 1)
  else
    if (done == 0) then
      for i,object in ipairs(deckZone.getObjects()) do
        if (object.tag == "Deck" or object.tag == "Card") then
          clonedDeck = object.clone({ position = {0,0,20} })
          clonedDeck.setInvisibleTo(players)
          object.deal(5, player1)
          object.deal(5, player2)
          object.shuffle()
          decideFirstPlayer()
        end
      end
    end

    fillZone(setupZone1)
    fillZone(setupZone2)
    fillZone(setupZone3)
    fillZone(setupZone4)
    createDiscardSetupRowButtons(setupZone1Button)
    createDiscardSetupRowButtons(setupZone2Button)
    createDiscardSetupRowButtons(setupZone3Button)
    createDiscardSetupRowButtons(setupZone4Button)

    done = done + 1
    
    buttonSetup.setInvisibleTo(players)
    buttonSetup.clearButtons()
  end
end

function decideFirstPlayer()
  local random1 = math.random(x)
  local random2 = math.random(x)
  local flagPosition = flag.getPosition()
  if (random1 > random2) then
    flag.setPositionSmooth({flagPosition.x, flagPosition.y, flagPosition.z - 3.5}, false, true)
    broadcastToAll(player1 .. " is the first player", Color.Orange)
	playerGainCoin(player2)
  else
    flag.setPositionSmooth({flagPosition.x, flagPosition.y, flagPosition.z - 7}, false, true)
    broadcastToAll(player2 .. " is the first player", Color.Green)
	playerGainCoin(player1)
  end
end

function createDiscardSetupRowButtons(button)
  button.setInvisibleTo()
  button.clearButtons()
  button.createButton({click_function = 'discardSetupRow', label = "X", color = { 1, 0, 0 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 0, 0}, width = 1200, height = 1200, font_size = 600
  })
end

function fillZone(zone)
  local zonePosition = zone.getPosition()
  if (#zone.getObjects() == 0) then
    for i,objectDeck in ipairs(deckZone.getObjects()) do
      if (objectDeck.tag == "Deck" or objectDeck.tag == "Card") then
        local count = #objectDeck.getObjects()
        for j=0, count < 5 and count-1 or 4, 1 do
          objectDeck.takeObject({ flip = false, position = { zonePosition.x - 5 + j * 2.5, zonePosition.y, zonePosition.z }, rotation = {0, 180, 0}})
        end
        if (count < 5) then
          for k,objectDiscard in ipairs(discardZone.getObjects()) do
            if (objectDiscard.tag == "Deck" or objectDiscard.tag == "Card") then
              objectDiscard.shuffle()
              for j=count, 4, 1 do
                objectDiscard.takeObject({ flip = false, position = { zonePosition.x - 5 + j * 2.5, zonePosition.y, zonePosition.z }, rotation = {0, 180, 0}})
                count = count + 1
              end
              objectDiscard.setPositionSmooth(objectDeck.getPosition(), false, true)
              objectDiscard.setRotationSmooth(objectDeck.getRotation(), false, true)
            end
          end
        end
      end
    end
  end
end

function resetSetupRow(obj, player)
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  local zoneWithCards = #setupZone1.getObjects() > 0 and 1 or 0
  zoneWithCards = zoneWithCards + (#setupZone2.getObjects() > 0 and 1 or 0)
  zoneWithCards = zoneWithCards + (#setupZone3.getObjects() > 0 f 1 or 0)
  zoneWithCards = zoneWithCards + (#setupZone4.getObjects() > 0 and 1 or 0)
  if (zoneWithCards == 3) then
    resetDiscardedRow(obj)
  else
    resetTakenRow(obj, player)
  end
end

function resetDiscardedRow(obj)
  local zonePosition = {0,0,0}
  if (obj == setupZone1Button) then
    zonePosition = setupZone1.getPosition()
  elseif (obj == setupZone2Button) then
    zonePosition = setupZone2.getPosition()
  elseif (obj == setupZone3Button) then
    zonePosition = setupZone3.getPosition()
  elseif (obj == setupZone4Button) then
    zonePosition = setupZone4.getPosition()
  end
  
  for i,object in ipairs(discardZone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      for j=0, 4, 1 do
        object.takeObject({ flip = false, position = { zonePosition.x - 5 + j * 2.5, zonePosition.y, zonePosition.z }, rotation = {0, 180, 0}})
      end
    end
  end
  
  Wait.time(function() createTakeSetupRowButtons() end, 0.3)
end

function resetTakenRow(obj, player)
  local zonePosition = {0,0,0}
  if (obj == setupZone1Button) then
    zonePosition = setupZone1.getPosition()
  elseif (obj == setupZone2Button) then
    zonePosition = setupZone2.getPosition()
  elseif (obj == setupZone3Button) then
    zonePosition = setupZone3.getPosition()
  elseif (obj == setupZone4Button) then
    zonePosition = setupZone4.getPosition()
  end
  
  local playerHandZone = (player == player1 and player1HandZone or player2HandZone)
  local playerHand = playerHandZone.getObjects()
  local playerHandCount = #playerHand
  for j=0, 4, 1 do
    playerHand[playerHandCount - (4 - j)].setPosition({zonePosition.x - 5 + j * 2.5, zonePosition.y, zonePosition.z})
  end
  
  Wait.time(function() createTakeSetupRowButtons() end, 0.3)
end

function discardSetupRow(obj)
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  if (obj == setupZone1Button) then
    discardCardsInZone(setupZone1)
  elseif (obj == setupZone2Button) then
    discardCardsInZone(setupZone2)
  elseif (obj == setupZone3Button) then
    discardCardsInZone(setupZone3)
  elseif (obj == setupZone4Button) then
    discardCardsInZone(setupZone4)
  end

  Wait.time(function() createTakeSetupRowButtons() end, 0.3)
end

function takeSetupRow(obj, color)
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  if (obj == setupZone1Button) then
    takeCardsInZone(setupZone1, color)
  elseif (obj == setupZone2Button) then
    takeCardsInZone(setupZone2, color)
  elseif (obj == setupZone3Button) then
    takeCardsInZone(setupZone3, color)
  elseif (obj == setupZone4Button) then
    takeCardsInZone(setupZone4, color)
  end

  Wait.time(function() createTakeSetupRowButtons() end, 0.3)
end

function createTakeSetupRowButtons()
  local zoneWithCards = #setupZone1.getObjects() > 0 and 1 or 0
  zoneWithCards = zoneWithCards + (#setupZone2.getObjects() > 0 and 1 or 0)
  zoneWithCards = zoneWithCards + (#setupZone3.getObjects() > 0 and 1 or 0)
  zoneWithCards = zoneWithCards + (#setupZone4.getObjects() > 0 and 1 or 0)
  if (zoneWithCards == 4) then
    createDiscardSetupRowButtons(setupZone1Button)
    createDiscardSetupRowButtons(setupZone2Button)
    createDiscardSetupRowButtons(setupZone3Button)
    createDiscardSetupRowButtons(setupZone4Button)
  else
    local lastRow = zoneWithCards == 1
    tryCreateTakeSetupRowButton(setupZone1Button, setupZone1, lastRow)
    tryCreateTakeSetupRowButton(setupZone2Button, setupZone2, lastRow)
    tryCreateTakeSetupRowButton(setupZone3Button, setupZone3, lastRow)
    tryCreateTakeSetupRowButton(setupZone4Button, setupZone4, lastRow)
    if (lastRow) then
      buttonSetup.setInvisibleTo()
      buttonSetup.createButton({click_function = 'setup', label = (done == 2 and "End Setup" or "Refill"), color = { 0, 1, 0 },
        position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
      })
    else
      buttonSetup.setInvisibleTo(players)
      buttonSetup.clearButtons()
    end
  end
end

function tryCreateTakeSetupRowButton(button, zone, hideInstead)
  button.clearButtons()
  if (#zone.getObjects() > 0) then
    if (hideInstead) then
      button.setInvisibleTo(players)
    else
      button.createButton({click_function = 'takeSetupRow', label = "V", color = { 0, 1, 0 },
        position = {0.0, 0.4, 0.0}, rotation = {0, 0, 0}, width = 1200, height = 1200, font_size = 600
      })
    end
  else
    button.createButton({click_function = 'resetSetupRow', label = "O", color = { 1, 0, 1 },
      position = {0.0, 0.4, 0.0}, rotation = {0, 0, 0}, width = 1200, height = 1200, font_size = 600
    })
  end
end

function takeCardsInZone(zone, player)
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Card") then
      object.deal(1, player)
    end
  end
end

function market()
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  discardCardsInZone(marketZoneTop)
  moveMarket(marketZoneBottom)
  Wait.time(function() fillZone(marketZoneBottom) end, 0.3)
  buttonMarket.clearButtons()
  buttonMarket.setInvisibleTo(players)
  Wait.time(function() checkRoundWinCondition() end, 1)
end

function discardCardsInZone(zone)
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Card") then
      object.setPositionSmooth(discardZone.getPosition(), false, true)
      object.setRotationSmooth({180, -90, 0}, false, true)
    end
  end
end

function moveMarket(zone)
  local topPosition = marketZoneTop.getPosition()
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Card") then
      local objectPosition = object.getPosition()
      object.setPositionSmooth({ objectPosition.x, objectPosition.y, topPosition.z }, false, true)
      object.setRotationSmooth(object.getRotation(), false, true)
    end
  end
end

function clean()
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  cleanPlayer(player1, playZone1, exhaustZone1)
  cleanPlayer(player2, playZone2, exhaustZone2)
  buttonClean.clearButtons()
  buttonClean.setInvisibleTo(players)
  buttonMarket.setInvisibleTo()
  buttonMarket.createButton({click_function = 'market', label = "Market", color = { 0, 1, 0 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
  })
end

function cleanPlayer(player, playZone, exhaustZone)
  for i,object in ipairs(exhaustZone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      object.deal(99, player)
    end
  end

  for i,object in ipairs(playZone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      object.setPositionSmooth(exhaustZone.getPosition(), false, true)
      object.setRotationSmooth({180, -90, 0}, false, true)
    end
  end
end

function checkRoundWinCondition()
  if (buttonClean.getButtons() != nil and #buttonClean.getButtons() > 0) then
    return
  end

  local playZone1Objects = playZone1.getObjects()
  local playZone1Count = #playZone1Objects
  local playZone2Objects = playZone2.getObjects()
  local playZone2Count = #playZone2Objects
  local playHand1Count = #player1HandZone.getObjects()
  local playHand2Count = #player2HandZone.getObjects()
  if (playHand1Count == 0 or playHand2Count == 0) then
    if (playZone1Count == playZone2Count or (playZone1Count > playZone2Count and player1Empty) or (playZone1Count < playZone2Count and not player1Empty)) then
      tryRemoveSetCrownButton()
	else
      emptyHandWin(playHand1Count == 0)
      return
	end
  end

  if (playZone1Count != playZone2Count) then
    tryRemoveSetCrownButton()
    Wait.time(function() checkRoundWinCondition() end, 1)
    return
  end
  
  if (playZone1Count < 3) then
    tryRemoveSetCrownButton()
    Wait.time(function() checkRoundWinCondition() end, 1)
    return
  end

  local playZone1WinCount = 0
  local playZone2WinCount = 0
  local playZone1ConsecutiveWins = 0
  local playZone2ConsecutiveWins = 0
  local lastCard1Win = false
  local lastCard2Win = false
  for i,object in ipairs(playZone1.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      local rotationY = object.getRotation().y
      lastCard1Win = rotationY > 179 and rotationY < 181
      if (lastCard1Win) then
        playZone1WinCount = playZone1WinCount + 1
        playZone1ConsecutiveWins = playZone1ConsecutiveWins + 1
      else
        playZone1ConsecutiveWins = 0
      end
    end
  end
  for i,object in ipairs(playZone2.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      local rotationY = object.getRotation().y
      lastCard2Win = rotationY > 179 and rotationY < 181
      if (lastCard2Win) then
        playZone2WinCount = playZone2WinCount + 1
        playZone2ConsecutiveWins = playZone2ConsecutiveWins + 1
      else
        playZone2ConsecutiveWins = 0
      end
    end
  end

  if (lastCard1Win != lastCard2Win and (playZone1WinCount == 4 or playZone2WinCount == 4 or playZone1ConsecutiveWins == 3 or playZone2ConsecutiveWins == 3)) then
    if (lastCard1Win) then
      playerWon = 1
      createSetCrownButton(playZone1, true)
    else
      playerWon = 2
      createSetCrownButton(playZone2, false)
    end
  else
    tryRemoveSetCrownButton()
  end

  Wait.time(function() checkRoundWinCondition() end, 1)
end

function emptyHandWin(player1Empty)
  if (player1Empty) then
    playerWon = 2
    createSetCrownButton(playZone2, false)
  else
    playerWon = 1
    createSetCrownButton(playZone1, true)
  end
  Wait.time(function() checkRoundWinCondition() end, 1)
end

function createSetCrownButton(zone, placeUp)
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      local rotationY = object.getRotation().y
      if (rotationY > 179 and rotationY < 181) then
        object.createButton({click_function = 'setCrown', label = 'Select', width = 1050, height = 250, position = {0, 0, (placeUp == true and -2 or 2)}})
      end
    end
  end
end

function setCrown(obj)
  buttonClean.setInvisibleTo()
  buttonClean.createButton({click_function = 'clean', label = "Clean", color = { 0, 0, 1 },
    position = {0.0, 0.4, 0.0}, rotation = {0, 180, 0}, width = 3000, height = 1200, font_size = 600
  })

  if (obj.tag == "Deck") then
    obj.takeObject({ flip = false, position = (playerWon == 1 and player1WinsZone or player2WinsZone).getPosition(), rotation = {180, 180, 0}})
  else
    obj.setPositionSmooth((playerWon == 1 and player1WinsZone or player2WinsZone).getPosition(), false, true)
    obj.setRotationSmooth({180, 180, 0}, false, true)
  end
  
  tryRemoveSetCrownButton()
end

function tryRemoveSetCrownButton()
  if (playerWon == 0) then
    return
  end

  local zone = playerWon == 1 and playZone1 or playZone2
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      object.clearButtons()
    end
  end
  playerWon = 0
end

function onObjectEnterZone(zone, object)
  updateZone(zone)
end

function onObjectLeaveZone(zone, object)
  updateZone(zone)
end

function updateZone(zone)
  if (zone == player1CoinsZone) then
    player1CoinsText.setValue('' .. zoneCount(zone))
  elseif (zone == player1WinsZone) then
    player1WinsText.setValue('' .. zoneCount(zone))
  elseif (zone == player2CoinsZone) then
    player2CoinsText.setValue('' .. zoneCount(zone))
  elseif (zone == player2WinsZone) then
    player2WinsText.setValue('' .. zoneCount(zone))
  elseif (zone == exhaustZone1) then
    player1ExhaustText.setValue('' .. zoneCount(zone))
  elseif (zone == exhaustZone2) then
    player2ExhaustText.setValue('' .. zoneCount(zone))
  elseif (zone == player1HandZone) then
    player1HandText.setValue('' .. zoneCount(zone))
  elseif (zone == player2HandZone) then
    player2HandText.setValue('' .. zoneCount(zone))
  end
end

function zoneCount(zone)
  local count = 0
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Deck") then
      count = count + #object.getObjects()
    elseif (object.tag == "Card") then
      count = count + 1
    end
  end
  return count
end

function gainCoin(obj, color)
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)
  
  playerGainCoin(color)
end

function playerGainCoin(player)
  local zone = player == player1 and player1CoinsZone or player2CoinsZone
  for i,object in ipairs(deckZone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      object.takeObject({ flip = false, position = zone.getPosition(), rotation = {180, 0, 0}})
    end
  end
end

function spendCoin(obj, color)
  if (antiSpam) then
    return
  end

  antiSpam = true
  Wait.time(function() antiSpam = false end, 1)

  local zone = color == player1 and player1CoinsZone or player2CoinsZone
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Deck") then
      object.takeObject({ flip = false, position = discardZone.getPosition(), rotation = {0, 90, 180}})
    elseif (object.tag == "Card") then
      object.setPositionSmooth(discardZone.getPosition(), false, true)
      object.setRotationSmooth({0, 90, 180}, false, true)
    end
  end
end