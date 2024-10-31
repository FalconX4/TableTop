--If you want to use a different deck of your own, create and load a fresh save with 
--your deck somewhere, then copy its GUID and replace the one below labeled bigDeck_GUID.

--If you want to modify the deck I have, go to 'onLoad' below and put '--' before bigDeck.interactable,
--then use the gizmo tool at the top of the table where the deck is hidden, to lift it up.

bigDeck_GUID = '837a6f'

scoreClicked = false

storyCard = {
  guid = nil,
  number = nil,
  storyTeller = nil
}

answer = {
  position = {-29.34, 0.97, -2.16},
  scale = {5.40, 1.00, 5.40},
  rotation = {0.00, 180.00, 0.00}
}


playerColors = {
  "Red",
  "Yellow",
  "Orange",
  "Green",
  "Blue",
  "Purple",
  "Pink",
  "White"
}

scoreCounters = {
  ["Green"] = "92bc7d",
  ["Blue"] = "46c679",
  ["Purple"] = "2c9804",
  ["Pink"] = "b81596",
  ["White"] = "1de687",
  ["Red"] = "4c27b7",
  ["Orange"] = "b447ec",
  ["Yellow"] = "217709"
}


playerTokens = {
  ["Green"] = "de1faa",
  ["Blue"] = "21336c",
  ["Purple"] = "c7b29e",
  ["Pink"] = "d0e019",
  ["White"] = "7920a5",
  ["Red"] = "4102cf",
  ["Orange"] = "01ab47",
  ["Yellow"] = "3f5383"
}

scoreAvatars = {
  ["Green"] = "fb056c",
  ["Blue"] = "859a36",
  ["Purple"] = "92f730",
  ["Pink"] = "402eaa",
  ["White"] = "868415",
  ["Red"] = "e2d03a",
  ["Orange"] = "513ba3",
  ["Yellow"] = "018d64"
}

tokenStartPos = {}



antiSpam = false
cardOwnership = {
  --color: tableOfValidGUIDS
  ["Green"] = {},
  ["Blue"] = {},
  ["Purple"] = {},
  ["Pink"] = {},
  ["White"] = {},
  ["Red"] = {},
  ["Orange"] = {},
  ["Yellow"] = {}
}

scoreGreen = 0
scoreBlue = 0
scorePurple = 0
scorePink = 0
scoreWhite = 0
scoreRed = 0
scoreOrange = 0
scoreYellow = 0

scores = {
  --color: tableOfValidGUIDS
  ["Green"] = 0,
  ["Blue"] = 0,
  ["Purple"] = 0,
  ["Pink"] = 0,
  ["White"] = 0,
  ["Red"] = 0,
  ["Orange"] = 0,
  ["Yellow"] = 0
}
--
------
drawNumber = 6
buttonLabel = "Draw to " .. drawNumber

-----------------------------------

winToken_GUID = '1c21a0'
buttons_GUID = 'c5fe7e'

scoreZone_1_GUID = '328476'
scoreZone_2_GUID = '8a16a5'
scoreZone_3_GUID = '6b8fec'
scoreZone_4_GUID = 'af7f06'
scoreZone_5_GUID = '917e6d'
scoreZone_6_GUID = '556289'
scoreZone_7_GUID = '5fa7f8'

score_zones = {
  [1] = '328476',
  [2] = '8a16a5',
  [3] = '6b8fec',
  [4] = 'af7f06',
  [5] = '917e6d',
  [6] = '556289',
  [7] = '5fa7f8'
}

zone_1_win_GUID = 'bfcb3d'
zone_2_win_GUID = '2f6101'
zone_3_win_GUID = '98484a'
zone_4_win_GUID = '5bd6c7'
zone_5_win_GUID = '771f7c'
zone_6_win_GUID = 'dca112'
zone_7_win_GUID = 'c17c26'
zone_8_win_GUID = '25fc6d'

numberZones = {
  [1] ='bfcb3d',
  [2] ='2f6101',
  [3] ='98484a',
  [4] ='5bd6c7',
  [5] ='771f7c',
  [6] ='dca112',
  [7] ='c17c26',
  [8] ='25fc6d'
}

cardZones = {
  [1] = 'dbdc9a',
  [2] = '0673b5',
  [3] = 'b3e7f9',
  [4] = '65ac24',
  [5] = '1ff5cd',
  [6] = '93f517',
  [7] = 'ea953c',
  [8] = '82638c'
}
zone_1_a_GUID = 'dbdc9a'
zone_2_a_GUID = '0673b5'
zone_3_a_GUID = 'b3e7f9'
zone_4_a_GUID = '65ac24'
zone_5_a_GUID = '1ff5cd'
zone_6_a_GUID = '93f517'
zone_7_a_GUID = 'ea953c'
zone_8_a_GUID = '82638c'



centerZones = {}
scoreZones = {}
stuffZone = {}
scoreTileZone = {}

reveal = 1
score = 0
clean = 0

rows = {['a'] = -1.72,}
cols = {[1] = -16.04, [2] = -11.48, [3] = -6.92, [4] = -2.36, [5] = 2.20, [6] = 6.79, [7] = 11.39, [8] = 15.99}

function onload()

    bigDeck = getObjectFromGUID(bigDeck_GUID)
    bigDeck.interactable = false

    for player, counter in pairs(scoreCounters) do
      getObjectFromGUID(counter).interactable = false
    end
    for player, guid in pairs(playerTokens) do
      tokenStartPos[player] = getObjectFromGUID(guid).getPosition()
    end
    setPlayerAvatars()

    getObjectFromGUID('3c3931').call("pushSet", {})
    getObjectFromGUID('2c1953').call("pushSet", {})
    getObjectFromGUID('636b2b').call("pushSet", {})
    getObjectFromGUID('b83670').call("pushSet", {})
    getObjectFromGUID('189f59').call("pushSet", {})
    getObjectFromGUID('7f6134').call("pushSet", {})
    getObjectFromGUID('2e874b').call("pushSet", {})
    getObjectFromGUID('b5dee7').call("pushSet", {})

    winToken = getObjectFromGUID(winToken_GUID)
    stars = getObjectFromGUID('8430cf')
    stars.interactable = false

    stuffZone[1] = {['stuff'] = getObjectFromGUID('949f62')}
	scoreTileZone[1] = {['tiles'] = getObjectFromGUID('61ad29')}

    scoreZones['1'] = {['sco'] = getObjectFromGUID(scoreZone_1_GUID)}
    scoreZones['2'] = {['sco'] = getObjectFromGUID(scoreZone_2_GUID)}
    scoreZones['3'] = {['sco'] = getObjectFromGUID(scoreZone_3_GUID)}
    scoreZones['4'] = {['sco'] = getObjectFromGUID(scoreZone_4_GUID)}
    scoreZones['5'] = {['sco'] = getObjectFromGUID(scoreZone_5_GUID)}
    scoreZones['6'] = {['sco'] = getObjectFromGUID(scoreZone_6_GUID)}
    scoreZones['7'] = {['sco'] = getObjectFromGUID(scoreZone_7_GUID)}

    centerZones['1'] = {['win'] = getObjectFromGUID(zone_1_win_GUID), ['a'] = getObjectFromGUID(zone_1_a_GUID)}
    centerZones['2'] = {['win'] = getObjectFromGUID(zone_2_win_GUID), ['a'] = getObjectFromGUID(zone_2_a_GUID)}
    centerZones['3'] = {['win'] = getObjectFromGUID(zone_3_win_GUID), ['a'] = getObjectFromGUID(zone_3_a_GUID)}
    centerZones['4'] = {['win'] = getObjectFromGUID(zone_4_win_GUID), ['a'] = getObjectFromGUID(zone_4_a_GUID)}
    centerZones['5'] = {['win'] = getObjectFromGUID(zone_5_win_GUID), ['a'] = getObjectFromGUID(zone_5_a_GUID)}
    centerZones['6'] = {['win'] = getObjectFromGUID(zone_6_win_GUID), ['a'] = getObjectFromGUID(zone_6_a_GUID)}
    centerZones['7'] = {['win'] = getObjectFromGUID(zone_7_win_GUID), ['a'] = getObjectFromGUID(zone_7_a_GUID)}
    centerZones['8'] = {['win'] = getObjectFromGUID(zone_8_win_GUID), ['a'] = getObjectFromGUID(zone_8_a_GUID)}

    buttonZone = getObjectFromGUID(buttons_GUID)
    buttonZone.createButton({click_function = 'randomizePlayArea', label = "1. Reveal",
      position = {5,0,0}, rotation = {0,180,0}, width = 900, height = 300, font_size = 150
    })
    buttonZone.createButton({click_function = 'buttonScore', label = "2. Score",
      position = {0,0,1.25}, rotation = {0,180,0}, width = 775, height = 300, font_size = 150
    })
    buttonZone.createButton({click_function = 'buttonCleanup', label = "3. Clean Up",
      position = {-5,0,0}, rotation = {0,180,0}, width = 900, height = 300, font_size = 150
    })
    buttonZone.createButton({click_function = 'drawTo', label = buttonLabel,
      position = {0,0,4.5}, rotation = {0,180,0}, width = 775, height = 300, font_size = 150
    })

    bigDeck.shuffle()

    doofie1 = getObjectFromGUID('89ab53')
    doofie2 = getObjectFromGUID('1e4708')
    doofie3 = getObjectFromGUID('6f9b19')
    doofie4 = getObjectFromGUID('ab4532')
    doofie5 = getObjectFromGUID('38f68c')
    doofie6 = getObjectFromGUID('a83bd0')
    doofie7 = getObjectFromGUID('19111f')
    doofie8 = getObjectFromGUID('a1f8fc')

    --doofie1.interactable = false
    --doofie2.interactable = false
    --doofie3.interactable = false
    --doofie4.interactable = false
    --doofie5.interactable = false
    --doofie6.interactable = false
    --doofie7.interactable = false
    --doofie8.interactable = false

    textStory = getObjectFromGUID('56a44e')
    textStory.interactable = false

end

function filterObjectEnterContainer(container, obj)
  if obj.tag == "Card" then
    return false
  end

  return true
end

function drawTo(object, player, alt)
  if alt then
    if drawNumber < 10 then
      drawNumber = drawNumber + 1
    else
      drawNumber = 6
    end
    buttonZone.editButton({
      index = 3,
      label = "Draw To " .. drawNumber
    })
  else
    if not antiSpam then
      antiSpam = true
      dealTo(player, drawNumber)
      Wait.time(function() antiSpam = false end, 1)
    end
  end
    --bigDeck.deal(6, pl)

end

function dealTo(player, number)
  if #Player[player].getHandObjects() < number then
    bigDeck.deal(number - #Player[player].getHandObjects(), player)


  --populate ownership
    Wait.frames(function()

      local handObjects = Player[player].getHandObjects()
      for _, obj in pairs(handObjects) do
        if obj.tag == "Card" then
          if not isInTbl(cardOwnership[player], obj.getGUID()) then
            table.insert(cardOwnership[player], obj.getGUID())
          end
        end
      end

    end, 100)

  end

end

function getStoryCard()
  local firstZone = getObjectFromGUID("dbdc9a")
  local objects = firstZone.getObjects()

  for _, obj in pairs(objects) do
    if obj.tag == "Card" then
      return obj
    end
  end

  return nil
end

function randomizePlayArea()

	if reveal == 0 then print("Cards already revealed, click 'Score' or 'Clean Up'")
	end
	if reveal == 1 then

		for i,s in pairs(stuffZone) do
			stuffs = s.stuff.getObjects()
				if (#stuffs == 0 ) then print("Place cards facedown in the center row")
				end

			if (#stuffs > 0 ) then

winToken.setPositionSmooth({-21.32, 2, 2.29})

        local storyObj = getStoryCard()
        if storyCard == nil then
          print("Put your story in the first slot")
          return nil
        end

        storyCard.guid = storyObj.getGUID()
        storyCard.storyTeller = getOwner(storyCard.guid)
        --set token color to story teller Color
        --winToken.setColorTint(Color.fromString(storyCard.storyTeller))

				print("Place votes facedown in the upper grid, then click 'Score'")

				clean = 1
				score = 1
				reveal = 0

				cards = {}
				order = {}
				count = 0

				for k,v in pairs(centerZones) do
					carda = v.a.getObjects()
					if (#carda > 0 ) then
						count = count + 1
						order[count] = k
						cards[tostring(k)] = { ['a'] = nil }
						if (#carda > 0) then cards[tostring(k)]['a'] = carda[1]
						end
					end
				end

				N = count
				for i = N, 2, -1 do -- backwards
					local r = math.random(i) -- select a random number between 1 and i
					order[i], order[r] = order[r], order[i]
					--cards[i], cards[r] = cards[r], cards[i] -- swap the randomly selected item to position i
				end

				count = 0
				for k,v in pairs(cards) do
					count = count + 1
					random = order[count] + 0
					if cards[k]['a'] != nil then cards[k]['a'].setPosition({cols[random], 0.97, rows['a']})
					end
				end
        Wait.time(function()
          for index, zoneGUID in pairs(cardZones) do
            local zone = getObjectFromGUID(zoneGUID)
            local objects = zone.getObjects()
            for _, obj in pairs(objects) do
              if obj.tag == "Card" then
                if obj.getGUID() == storyCard.guid then
                  storyCard.number = index
                end
              end
            end
          end

        end,
        1)



				Timer.create({identifier='allCardsFlip', function_name='allCardsFlip', delay=0.1})
			end
		end
	end
end

function allCardsFlip(owner, color)
  card_direction = 0
  for k,v in pairs(centerZones) do
    card = {}
    for kt,vt in pairs({'a'}) do
      card[kt] = v[vt].getObjects()
      if #card[kt] > 0 then
        face = card_faceup(card[kt][1])
        if face and card_direction == 0 then card_direction = -1 end
        if not face and card_direction == 0 then card_direction = 1 end
        if face and card_direction == -1 then card[kt][1].flip() end
        if not face and card_direction == 1 then card[kt][1].flip() end
      end
    end
  end
end

function card_faceup(card)
  rot = card.getRotation()
  if (rot.z < 90) or (rot.z > 270) then
    return true
  else
    return false
  end
end

function buttonScore(owner, color)
  if score == 0 then print("Once cards are placed in the center, click 'Reveal'")
  end
  if score == 1 then
	for i,s in pairs(scoreTileZone) do
		voteTiles = s.tiles.getObjects()
			if (#voteTiles == 0 ) then print("Place votes facedown in the upper grid, then click 'Score'")
			end

		if (#voteTiles > 0 ) then

    textStory.call("blankName", {})

			Timer.create({identifier='lockTiles', function_name='lockTiles', delay=1.5})

			score = 0
			height = 1.5
			length1 = -3.5
			length2 = -3.5
			length3 = -3.5
			length4 = -3.5
			length5 = -3.5
			length6 = -3.5
			length7 = -3.5
			length8 = -3.5

      local playerVotes = {
        ["Green"] = nil,
        ["Blue"] = nil,
        ["Purple"] = nil,
        ["Pink"] = nil,
        ["White"] = nil,
        ["Red"] = nil,
        ["Orange"] = nil,
        ["Yellow"] = nil
      }

      scoreClicked = true

      for index, zoneGUID in pairs(score_zones) do
        local zone = getObjectFromGUID(zoneGUID)
        local objects = zone.getObjects()
        for _, obj in pairs(objects) do
          if obj.tag == "Card" then
            if  isInTbl(playerColors ,obj.getDescription()) then
              playerVotes[obj.getDescription()] = tonumber(obj.getName())
            end
          end
        end
      end

      addScores(playerVotes)
      --updateAvatarPositions
      setScorePositions()

      ----highlight cards and send player Tokens
      for index, zoneGUID in pairs(cardZones) do
        local zone = getObjectFromGUID(zoneGUID)
        local objects = zone.getObjects()

        for _, obj in pairs(objects) do
          if obj.tag == "Card" then
            local guid = obj.getGUID()
            local owner = getOwner(guid)

            if owner ~= nil then
              obj.highlightOn(Color.fromString(owner))
              local token = getObjectFromGUID(playerTokens[owner])
              local numberZone = getObjectFromGUID(numberZones[index])
              token.setPositionSmooth(numberZone.getPosition(), false, true)
            end
          end
        end
      end

      --Move win token to storytellers card
      local cardGUID = storyCard.guid
      answerCard = getObjectFromGUID(cardGUID)
      winToken.setPositionSmooth(answerCard.getPosition() + vector(0, 1, 0), false, true)
      answerCard.setPositionSmooth(answer.position, false, false)
      answerCard.setScale(answer.scale)
      answerCard.setRotation(answer.rotation)
      answerCard.interactable = false



			for k,v in pairs(scoreZones) do
				card = {}
				for kt,vt in pairs({'sco'}) do
					card[kt] = v[vt].getObjects()
						if #card[kt] > 0 then
							if card[kt][1].tag == "Card" or card[kt][1].tag == "Deck" then
								if card[kt][1].getName() == '1' then
									length1 = length1 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({-16.04,height,length1})
								end
								if card[kt][1].getName() == '2' then
									length2 = length2 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({-11.48,height,length2})
								end
								if card[kt][1].getName() == '3' then
									length3 = length3 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({-6.92,height,length3})
								end
								if card[kt][1].getName() == '4' then
									length4 = length4 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({-2.36,height,length4})
								end
								if card[kt][1].getName() == '5' then
									length5 = length5 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({2.20,height,length5})
								end
								if card[kt][1].getName() == '6' then
									length6 = length6 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({6.79,height,length6})
								end
								if card[kt][1].getName() == '7' then
									length7 = length7 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({11.39,height,length7})
								end
								if card[kt][1].getName() == '8' then
									length8 = length8 + -1.75
									card[kt][1].flip()
									card[kt][1].setRotationSmooth({180,0,180})
									card[kt][1].setPositionSmooth({15.99,height,length8})
								end
							end
						end
					end
				end
			end
		end
	end
end

function addScores(votes)

  ---check if all guessed correct
  allCorrect = true
  for player, vote in pairs(votes) do
    if vote ~= nil then
      if vote ~= storyCard.number then
        allCorrect = false
      end
    end
  end

  if allCorrect then
    print("Everyone got it Right")
    for player, vote in pairs(votes) do
      if vote ~= nil and player ~= storyCard.storyTeller then
        scores[player] = scores[player] + 2
        if Player[player].seated then
          broadcastToColor("You got 2 Points", player, Color.fromString(player))
        end
      end
    end
    displayScores()
    return true
  end

  allWrong = true
  for player, vote in pairs(votes) do
    if vote ~= nil then

      if vote == storyCard.number then
        allWrong = false
      end
    end
  end

  if allWrong then
    print("Everyone got it Wrong")
    for player, vote in pairs(votes) do
      if vote ~= nil and player ~= storyCard.storyTeller then
        scores[player] = scores[player] + 2
        if Player[player].seated then
          broadcastToColor("You got 2 Points", player, Color.fromString(tostring(player)))
        end
      end
    end
  end

  if not allWrong then
    --story teller gets 3 Points
    scores[storyCard.storyTeller] = scores[storyCard.storyTeller] + 3
    if Player[storyCard.storyTeller].seated then
      broadcastToColor("You got 3 Points as the Story Teller", storyCard.storyTeller, Color.fromString(storyCard.storyTeller))
    end

  --correct players get 3 points
    for player, vote in pairs(votes) do
      if vote ~= nil and player ~= storyCard.storyTeller then
          if vote == storyCard.number then
            scores[player] = scores[player] + 3
            if Player[player].seated then
              broadcastToColor("You get 3 Points for guessing correctly", player, Color.fromString(player))
            end
          end
      end
    end
  end
  --card owners get a point per vote

  for player, vote in pairs(votes) do
    if vote ~= nil and player ~= storyCard.storyTeller then
      local chosenZoneGUID = cardZones[vote]
      local chosenZone = getObjectFromGUID(chosenZoneGUID)
      local objects = chosenZone.getObjects()
      local cardGUID = nil
      for _, obj in pairs(objects) do
        if obj.tag == "Card" then
          cardGUID = obj.getGUID()
        end
      end

      if cardGUID ~= nil then

        local owner = getOwner(cardGUID)
        if owner ~= player and owner ~= storyCard.storyTeller then
          scores[owner] = scores[owner] + 1
          if Player[player].seated then
            broadcastToColor(player.." guessed your card 1 point", owner, Color.fromString(owner))
          end
        end
      end
    end
  end



displayScores()

end

function displayScores()



  for player, score in pairs(scores) do
      local scoreCounter = getObjectFromGUID(scoreCounters[player])
      scoreCounter.call("set_Val", {number = score})

      if Player[player].seated then
        printToAll(player.." has "..score.." points", Color.fromString(player))
        if score >= 30 then
          broadcastToAll(player.." Wins!", Color.fromString(player))
        end
      end

  end
end

function lockTiles()
  local lockZone = getObjectFromGUID('949f62')
    for i, obj in ipairs(lockZone.getObjects()) do
      if not isInTbl(playerTokens, obj.getGUID()) then
        obj.setLock(true)
      end
    end
end

function buttonCleanup(owner, color)
  if clean == 0
    then print("Once cards are placed in the center, click 'Reveal'")
  end
  if clean == 1
    then
    --winToken.setColorTint(Color.fromString("White"))
    textStory.call("reloadAll", {})
    unlockTiles()
    clean = 0
    reveal = 1
    score = 0
    getObjectFromGUID('3c3931').call("recall", {})
    getObjectFromGUID('2c1953').call("recall", {})
    getObjectFromGUID('636b2b').call("recall", {})
    getObjectFromGUID('b83670').call("recall", {})
    getObjectFromGUID('189f59').call("recall", {})
    getObjectFromGUID('7f6134').call("recall", {})
    getObjectFromGUID('2e874b').call("recall", {})
    getObjectFromGUID('b5dee7').call("recall", {})

  for _, player in pairs(getSeatedPlayers()) do
    dealTo(player, drawNumber)
  end

  if scoreClicked then
    Turns.turn_color = Turns.getNextTurnColor()
  end

  height = 3

  for k,v in pairs(centerZones) do
    card = {}
    for kt,vt in pairs({'a'}) do
      card[kt] = v[vt].getObjects()
      if #card[kt] > 0 then
         height = height + 0.1
        if card[kt][1].tag == "Card" or card[kt][1].tag == "Deck" then

          card[kt][1].setRotationSmooth({180,0,180})
          revokeOwnership(card[kt][1].getGUID())
          card[kt][1].destruct()
        end
      end
    end
    if scoreClicked then
      revokeOwnership(answerCard.getGUID())
      answerCard.destruct()
    end
    winToken.setPositionSmooth({-16.04, 2, 2.29})
    for player, guid in pairs(playerTokens) do
      local token = getObjectFromGUID(guid)
      token.setPositionSmooth(tokenStartPos[player], false, false)
    end

    scoreClicked = false
  end
end
end

function unlockTiles()
  local lockZone = getObjectFromGUID('949f62')
    for i, obj in ipairs(lockZone.getObjects()) do
      if not isInTbl(playerTokens, obj.getGUID()) then
        obj.setLock(false)
      end
    end
end

function isInTbl(tbl, value)
  for k, v in pairs(tbl) do
    if v == value then
      return true
    end
  end

  return false

end

function getOwner(chosenGUID)
  for player, tbl in pairs(cardOwnership) do
    for _, guid in pairs(tbl) do
      if chosenGUID == guid then
        return player
      end
    end
  end

  return nil
end

function setPlayerImage(p)
      if p.color != 'Grey' and p.color != 'Black' then
          local webData = WebRequest.get('http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' .. "B12285081AC59DD0B3B4CD7E03E300A0" .. '&steamids=' .. p.steam_id,
          function(response)
          local steamData = JSON.decode(response.text)
          local img = steamData['response']['players'][1]['avatarfull'] .. '&hash=' .. steamData['response']['players'][1]['avatarhash']
          getObjectFromGUID(playerTokens[p.color]).setCustomObject({
                    image = img
                })
          getObjectFromGUID(scoreAvatars[p.color]).setCustomObject({
            image = img
          })
                local newToken = getObjectFromGUID(playerTokens[p.color]).reload()
                newToken.interactable = false
                playerTokens[p.color] = newToken.getGUID()
                local newScoreToken = getObjectFromGUID(scoreAvatars[p.color]).reload()
                newScoreToken.interactable = false
        end)
      end
end

function onPlayerChangeColor(color)
  setPlayerAvatars()
end

function setPlayerAvatars()
  local players = getOrderedPlayers()
  for _, player in pairs(players) do
    setPlayerImage(Player[player])
  end

  for _, player in pairs(playerColors) do
    if not isInTbl(players, player) then
      resetToken(player)
    end
  end

  Wait.time(function() setScorePositions() end, 0.5)

end

function setScorePositions()


  local centerPoint = {x =-0.08, y = 1, z = 14.14}
  local players = getOrderedPlayers()
  local playerCount = #players
  local width = 3
  local leftPoint = centerPoint.x - ((width * playerCount) / 2) + (width/2)

  for index, player in ipairs(players) do
    local scoreAvatar = getObjectFromGUID(scoreAvatars[player])
    local scoreCounter = getObjectFromGUID(scoreCounters[player])

    local avatarPosition = vector(
    leftPoint + (index - 1) * width,
     centerPoint.y,
     centerPoint.z + (width / 2))

    scoreAvatar.setPositionSmooth(avatarPosition, false, true)

    local scoreCounterPosition = vector(
    leftPoint + (index - 1) * width,
    centerPoint.y,
    centerPoint.z - (width / 2))
    scoreCounter.setPositionSmooth(scoreCounterPosition, false, true)
  end

  for _, player in pairs(playerColors) do
    if not isInTbl(players, player) then
      local scoreAvatar = getObjectFromGUID(scoreAvatars[player])
      local scoreCounter = getObjectFromGUID(scoreCounters[player])

      scoreAvatar.setPositionSmooth({0, 0, 36}, false, true)
      scoreCounter.setPositionSmooth({0,0, 36}, false, true)
    end
  end
end

function getOrderedPlayers()
  local seatedPlayers = getSeatedPlayers()
  local scores = scores
  local mergedTable = {}
  local returnTbl = {}

  for _, player in ipairs(seatedPlayers) do
    table.insert(mergedTable, {player = player, score = scores[player]})
  end

  table.sort(mergedTable, function(a, b) return a.score > b.score end)

  for index, tbl in ipairs(mergedTable) do
    table.insert(returnTbl, tbl.player)
  end

  return returnTbl
end


function resetToken(player)
  if player ~= "Grey" and player ~= "Black" then
    local token = getObjectFromGUID(playerTokens[player])
    token.setCustomObject({
              image = "http://cloud-3.steamusercontent.com/ugc/1461933361183063701/7812EAA12B13D1380BF4871EF917F783F4D340CC/"
          })
    local newToken = token.reload()
    playerTokens[player] = newToken.getGUID()
    newToken.interactable = false

    local scoreToken = getObjectFromGUID(scoreAvatars[player])
    scoreToken.setCustomObject({
              image = "http://cloud-3.steamusercontent.com/ugc/1461933361183063701/7812EAA12B13D1380BF4871EF917F783F4D340CC/"
            })
    local newScoreToken = scoreToken.reload()
    scoreAvatars[player] = scoreToken.getGUID()
    newScoreToken.interactable = false
  end
end

function revokeOwnership(guid)
  local owner = getOwner(guid)
  if owner == nil then
    return nil
  end
  for index, cardGUID in ipairs(cardOwnership[owner]) do
    if guid == cardGUID then
      table.remove(cardOwnership[owner], index)
    end
  end
end

function onUpdate()
  scoreGreen = scores["Green"]
  scoreBlue = scores["Blue"]
  scorePurple = scores["Purple"]
  scorePink = scores["Pink"]
  scoreWhite = scores["White"]
  scoreRed = scores["Red"]
  scoreOrange = scores["Orange"]
  scoreYellow = scores["Yellow"]
end