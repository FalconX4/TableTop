frameSet = {}
frameBagGUID = '883d7c'
frameBagExtGUID = '69fad9'
fieldSet = {}
fieldBagGUID = '3be35a'
fieldBagExtGUID = 'ae16c7'
chitSet = {}
chitBagGUID = '62ed97'
chitBagExtGUID = 'c3389c'
harborSet = {}
harborBagGUID = 'b94d3c'
harborBagExtGUID = '419078'
decks = {}
decksExt = {}
robber = {}
robberGUID = 'e92d6c'
menuBoard = {}
menuBoardGUID = '152a49'
tileStack = {}
fieldPositions = {}
harborPositions = {}
harborRotations = {}
rules = {}
rulesGUID = '200948'
zones = {}
boardZoneGUID = '4ed9a5'
whiteZoneGUID = '5f2049'
brownZoneGUID = 'e9ccdf'
redZoneGUID = 'cec6ed'
orangeZoneGUID = '51910a'
greenZoneGUID = 'fffd0b'
blueZoneGUID = 'd75926'
counters = {}
counterWhiteGUID = 'c5dbd8'
counterBrownGUID = 'ed2402'
counterOrangeGUID = 'f64bdb'
counterRedGUID = '3f7abd'
counterGreenGUID = '70adee'
counterBlueGUID = '3c4a8c'
dieOne = {}
dieOneGUID = '5e2e86'
dieOneRolling = false
dieTwo = {}
dieTwoGUID = 'd33a03'
dieTwoRolling = false
dieSum = {}
oldDieSum = {}
tileList = {}
VP_cards = {}
extensionEnabled = false
memoryChit = {}
memoryChitGUID = 'efe7cb'
memoryStart = {}
memoryStartGUID = 'fd6a2f'
randomHarbors = false
randomChits = false
chitsFog = false
autoVP = true
gameStart = false
beginner = false
stat_score = {
  [2] = 0,
  [3] = 0,
  [4] = 0,
  [5] = 0,
  [6] = 0,
  [7] = 0,
  [8] = 0,
  [9] = 0,
  [10] = 0,
  [11] = 0,
  [12] = 0
}
beginnerNotes = [[
                [FFFF00][b]Catan - The Turn[/b]
                [FFFFFF][b]Part 1: Dice Roll[/b]
                The player rolls the dice.
                Any tile matching the roll produces resources for each building bordering it.
                Rolling a seven activates the robber.

                [b]Part 2: Trade[/b]
                With players, ports or the bank.

                [b]Part 3: Building[/b]
                Resources can be exchanged for roads, buildings or development cards.
                Roads must connect to other roads.
                Settlements must connect by roads.
                Settlements cannot be built adjacent to another settlement.
                Cities are upgraded settlements.

                [FFFF00][b]Catan - Trading[/b]
                [FFFFFF]Bank trades at a 4:1 ratio.
                Standard port ratio is 3:1.
                Marked port ratio is 2:1.
                Only the player whose turn it is may offer, or be offered, trades.
                ]]

function onload()

    robber = getObjectFromGUID( robberGUID )
    menuBoard = getObjectFromGUID( menuBoardGUID )
    rules = getObjectFromGUID( rulesGUID )
    decks = { 'fb31d5', '7d778e', '791d99', 'a12724', '4f06de', 'add2c5' }
    decksExt = { '5277e9', 'd3218a', '1072af', '73faab', '59096b', 'd21475' }
		zones = { ["Board"] = getObjectFromGUID( boardZoneGUID ),
							["White"] = getObjectFromGUID( whiteZoneGUID ),
              ["Brown"] = getObjectFromGUID( brownZoneGUID ),
							["Red"] = getObjectFromGUID( redZoneGUID ),
							["Orange"] = getObjectFromGUID( orangeZoneGUID ),
              ["Green"] = getObjectFromGUID( greenZoneGUID ),
							["Blue"] = getObjectFromGUID( blueZoneGUID ) }
		counters = { ["White"] = getObjectFromGUID( counterWhiteGUID ),
                 ["Brown"] = getObjectFromGUID( counterBrownGUID ),
								 ["Red"] = getObjectFromGUID( counterRedGUID ),
								 ["Orange"] = getObjectFromGUID( counterOrangeGUID ),
                 ["Green"] = getObjectFromGUID( counterGreenGUID ),
							 	 ["Blue"] = getObjectFromGUID( counterBlueGUID ) }
		dieOne = getObjectFromGUID( dieOneGUID )
		dieTwo = getObjectFromGUID( dieTwoGUID )
    memoryChit = getObjectFromGUID( memoryChitGUID )
    memoryStart = getObjectFromGUID( memoryStartGUID )

    framePositions = {
        {x = -3.01, y = 0.985, z = -8.69},
        {x = -9.02, y = 0.985, z = -1.73},
        {x = -6.01, y = 0.985, z =  6.95},
        {x =  3.01, y = 0.985, z =  8.69},
        {x =  9.02, y = 0.985, z =  1.73},
        {x =  6.01, y = 0.985, z = -6.95} }

    frameRotations = {
        {y = 120, z = 0},
        {y = 180, z = 0},
        {y = 240, z = 0},
        {y = 300, z = 0},
        {y = 360, z = 0},
        {y = 60,  z = 0} }

    framePositionsExt = {
        {x = -3.01, y = 0.985, z =  10.43},
        {x =  3.01, y = 0.985, z =  10.43},
        {x =  9.03, y = 0.985, z =  6.96},
        {x = 12.04, y = 0.985, z =  1.74},
        {x =  9.03, y = 0.985, z = -6.95},
        {x =  3.01, y = 0.985, z = -10.41},
        {x = -3.01, y = 0.985, z = -10.41},
        {x = -9.03, y = 0.985, z = -6.95},
        {x =-12.03, y = 0.985, z = -1.73},
        {x = -9.03, y = 0.985, z =  6.96} }

    frameRotationsExt = {
        {y = 240, z = 0},
        {y = 300, z = 0},
        {y = 300, z = 0},
        {y = 360, z = 0},
        {y = 60,  z = 0},
        {y = 60,  z = 0},
        {y = 120, z = 0},
        {y = 120, z = 0},
        {y = 180, z = 0},
        {y = 240, z = 0} }

    fieldPositions = {
        {x =  6.02, y = 1.00, z = -3.48}, -- A
        {x =  6.02, y = 1.00, z =  0.00}, -- B
        {x =  6.02, y = 1.00, z =  3.48}, -- C
        {x =  3.01, y = 1.00, z =  5.22}, -- D
        {x =  0.00, y = 1.00, z =  6.96}, -- E
        {x = -3.01, y = 1.00, z =  5.22}, -- F
        {x = -6.02, y = 1.00, z =  3.48}, -- G
        {x = -6.02, y = 1.00, z =  0.00}, -- H
        {x = -6.02, y = 1.00, z = -3.48}, -- I
        {x = -3.01, y = 1.00, z = -5.22}, -- J
        {x =  0.00, y = 1.00, z = -6.96}, -- K
        {x =  3.01, y = 1.00, z = -5.22}, -- L
        {x =  3.01, y = 1.00, z = -1.74}, -- M
        {x =  3.01, y = 1.00, z =  1.74}, -- N
        {x =  0.00, y = 1.00, z =  3.48}, -- O
        {x = -3.01, y = 1.00, z =  1.74}, -- P
        {x = -3.01, y = 1.00, z = -1.74}, -- Q
        {x =  0.00, y = 1.00, z = -3.48}, -- Ra
        {x =  0.00, y = 1.00, z =  0.00} } -- Rb

    fieldPositionsExt = {
        {x =  9.03, y = 1.00, z = -3.48}, -- A
        {x =  9.03, y = 1.00, z =  0.00}, -- B
        {x =  9.03, y = 1.00, z =  3.48}, -- S
        {x =  6.02, y = 1.00, z =  5.22}, -- D
        {x =  3.01, y = 1.00, z =  6.96}, -- E
        {x =  0.00, y = 1.00, z =  8.70}, -- F
        {x = -3.01, y = 1.00, z =  6.96}, -- G
        {x = -6.02, y = 1.00, z =  5.22}, -- H
        {x = -9.03, y = 1.00, z =  3.48}, -- I
        {x = -9.03, y = 1.00, z =  0.00}, -- J
        {x = -9.03, y = 1.00, z = -3.48}, -- K
        {x = -6.02, y = 1.00, z = -5.22}, -- L
        {x = -3.01, y = 1.00, z = -6.96}, -- M
        {x =  0.00, y = 1.00, z = -8.70}, -- N
        {x =  3.01, y = 1.00, z = -6.96}, -- O
        {x =  6.02, y = 1.00, z = -5.22}, -- P
        {x =  6.02, y = 1.00, z = -1.74}, -- Q
        {x =  6.02, y = 1.00, z =  1.74}, -- R
        {x =  3.01, y = 1.00, z =  3.48}, -- S
        {x =  0.00, y = 1.00, z =  5.22}, -- T
        {x = -3.01, y = 1.00, z =  3.48}, -- U
        {x = -6.02, y = 1.00, z =  1.74}, -- V
        {x = -6.02, y = 1.00, z = -1.74}, -- W
        {x = -3.01, y = 1.00, z = -3.48}, -- X
        {x =  0.00, y = 1.00, z = -5.22}, -- Y
        {x =  3.01, y = 1.00, z = -3.48}, -- Za
        {x =  3.01, y = 1.00, z =  0.00}, -- Zb
        {x =  0.00, y = 1.00, z =  1.74}, -- Zc
        {x = -3.01, y = 1.00, z =  0.00}, -- Zd
        {x =  0.00, y = 1.00, z = -1.74} } -- Ze

    harborPositions = {
        {x =  0.00, y = 1.10, z =  10.35},
        {x = -6.27, y = 1.10, z =  6.65},
        {x = -8.90, y = 1.10, z =  1.75},
        {x = -8.90, y = 1.10, z = -5.30},
        {x = -2.70, y = 1.10, z = -8.75},
        {x =  3.15, y = 1.10, z = -8.75},
        {x =  8.84, y = 1.10, z = -5.10},
        {x =  8.65, y = 1.10, z =  1.82},
        {x =  5.88, y = 1.10, z =  6.88} }

    harborRotations = {
        {y = 0,   z = 0},
        {y = 300, z = 0},
        {y = 300, z = 0},
        {y = 240, z = 0},
        {y = 180, z = 0},
        {y = 180, z = 0},
        {y = 120, z = 0},
        {y = 60,  z = 0},
        {y = 60,  z = 0} }

    harborPositionsExt = {
        {x =  9.15, y = 1.10, z = -6.60},
        {x = 11.85, y = 1.10, z = -1.74},
        {x = 11.75, y = 1.10, z =  5.22},
        {x =  2.66, y = 1.10, z =  10.41},
        {x = -3.01, y = 1.10, z =  10.01},
        {x = -6.16, y = 1.10, z =  8.63},
        {x =-11.75, y = 1.10, z =  4.98},
        {x =-11.47, y = 1.10, z = -1.72},
        {x = -8.66, y = 1.10, z = -6.81},
        {x = -5.67, y = 1.10, z = -8.50},
        {x =  0.15, y = 1.10, z = -11.97} }

    harborRotationsExt = {
        {y = 120, z = 0},
        {y = 120, z = 0},
        {y = 60,  z = 0},
        {y = 0,   z = 0},
        {y = 300, z = 0},
        {y = 0,   z = 0},
        {y = 300, z = 0},
        {y = 240, z = 0},
        {y = 180, z = 0},
        {y = 240, z = 0},
        {y = 180, z = 0} }

    chits = {
        [2]  = {'c73aa0', nil},
        [3]  = {'c66987','b498b8', nil},
        [4]  = {'243da0','e82204', nil},
        [5]  = {'d43f82','f9d99b', nil},
        [6]  = {'c37186','f7c2fb', nil},
        [7]  = {robberGUID, nil},
        [8]  = {'d887c4','e9a0c9', nil},
        [9]  = {'05a5c8','cd8469', nil},
        [10] = {'6d5bec','d768ca', nil},
        [11] = {'12e325','4c6c37', nil},
        [12] = {'45c610', nil} }

    chitsExt = {
        [2]  = {'d43f82', '03a93d', nil},
        [3]  = {'d887c4', 'd768ca', 'ed5b9c'},
        [4]  = {'c37186', 'e82204', 'c56ad6'},
        [5]  = {'c73aa0', '666b15', 'de13d0'},
        [6]  = {'c66987', 'e9a0c9', '206da0'},
        [7]  = {robberGUID, nil},
        [8]  = {'05a5c8', 'cd8469', 'f9d99b'},
        [9]  = {'6d5bec', 'ee48a1', 'dec5f6'},
        [10] = {'243da0', 'f7c2fb', 'e65d67'},
        [11] = {'45c610', '12e325', 'b498b8'},
        [12] = {'4c6c37', '5c1b4e', nil} }

    if memoryChit.getName() == 'False' then autoVP = false
    else autoVP = true
    end
    if memoryChit.getDescription() == 'True' then chitSet = { nil, chitsExt }
    else chitSet = { nil, chits }
    end

    if memoryStart.getName() == 'False' then gameStart = false
    else gameStart = true
    end

		oldDieSum = dieOne.getValue() + dieTwo.getValue()
		Wait.time(function() resetStatScore() setStatsInNote() end, 0.5)
end


function createBoard()
    local currentTile = {}
    memoryChit.setName( autoVP )
    memoryChit.setDescription( extensionEnabled )
    memoryStart.setName( 'True' )
    gameStart = true

    if extensionEnabled then
        frameSet = { getObjectFromGUID( frameBagExtGUID ), framePositionsExt, frameRotationsExt }
        fieldSet = { getObjectFromGUID( fieldBagExtGUID ), fieldPositionsExt, nil }
        chitSet = { getObjectFromGUID( chitBagExtGUID ), chitsExt }
        harborSet = { getObjectFromGUID( harborBagExtGUID ), harborPositionsExt, harborRotationsExt }
        for i, deck in pairs( decks ) do
            getObjectFromGUID( decksExt[i] ).setPosition( getObjectFromGUID( deck ).getPosition())
            getObjectFromGUID( deck ).destruct()
        end
        getObjectFromGUID( decksExt[6] ).shuffle()
    else
        frameSet = { getObjectFromGUID( frameBagGUID ), framePositions, frameRotations }
        fieldSet = { getObjectFromGUID( fieldBagGUID ), fieldPositions, nil }
        chitSet = { getObjectFromGUID( chitBagGUID ), chits }
        harborSet = { getObjectFromGUID( harborBagGUID ), harborPositions, harborRotations }
        for i, deck in pairs( decksExt ) do
            getObjectFromGUID( deck ).destruct()
        end
        getObjectFromGUID( decks[6] ).shuffle()
    end

    menuBoard.destruct()
    if beginner == false then
        fieldSet[1].shuffle()
    end

    if randomChits then
        chitSet[1].shuffle()
    end

    placeTiles( frameSet )
    placeTiles( fieldSet )

    if randomHarbors then
        harborSet[1].shuffle()
        placeTiles( harborSet )
    end

    getObjectFromGUID( frameBagGUID ).destruct()
    getObjectFromGUID( frameBagExtGUID ).destruct()
    getObjectFromGUID( fieldBagGUID ).destruct()
    getObjectFromGUID( fieldBagExtGUID ).destruct()
    getObjectFromGUID( chitBagGUID ).destruct()
    getObjectFromGUID( chitBagExtGUID ).destruct()
    getObjectFromGUID( harborBagGUID ).destruct()
    getObjectFromGUID( harborBagExtGUID ).destruct()
	
	Wait.time(function() resetStatScore() setStatsInNote() end, 0.5)
end


function placeTiles( bag )
    local currentTile = {}
    while bag[1].getQuantity() > 0 do
        tileStack = bag[1].getQuantity()

        local params = {}
        params.position = { bag[2][tileStack].x, bag[2][tileStack].y, bag[2][tileStack].z }
        if bag[3] == nil then params.rotation = { 0, 180, 0 }
        else params.rotation = { 0, bag[3][tileStack].y, bag[3][tileStack].z }
        end

        currentTile = bag[1].takeObject( params )
        currentTile.setPosition( params.position )
        currentTile.setPosition( params.position )
        tileList[#tileList + 1] = { currentTile, params.position, params.rotation }

        if bag[1].getName() == 'Fields' then
            if currentTile.getDescription() == 'Desert' then
               params.position[2] = 1.10
               robber.setPosition( params.position )
               params.position[2] = 1.00
            else params.position[2] = 1.10
                 if chitsFog then params.rotation = { 0, 180, 180 }
                 end
                 currentTile  = chitSet[1].takeObject( params )
                 if chitsFog then
                    currentTile.setName('')
                    currentTile.setDescription('')
                 end
                 currentTile.setPosition( params.position )
                 currentTile.setRotation( params.rotation )
                 params.position[2] = 1.00
            end
        end
    end
end


function onObjectEnterScriptingZone( zone, object )
    if autoVP then
        local name = object.getName()
        local desc = object.getDescription()
        if zone == zones["Board"] then
            if name == 'Settlement' then
								counters[desc].Counter.increment()
            elseif name == 'City' then
                counters[desc].Counter.increment()
								counters[desc].Counter.increment()
            end
        elseif desc == '1 Victory Point!' then
            for color, area in pairs(zones) do
                if area == zone then
                    VP_cards[object.getGUID()] = color
                    object.setVar("active", nil)
                    object.setVar("inZone", true)
                end
            end
        elseif name == 'Largest Army' or name == 'Longest Road' then
						for color, area in pairs(zones) do
					  		if area == zone then
										counters[color].Counter.increment()
										counters[color].Counter.increment()
								end
					  end
        end
    end
end


function onObjectLeaveScriptingZone( zone, object )
    if autoVP then
        local name = object.getName()
        local desc = object.getDescription()
        if zone == zones["Board"] then
            if name == 'Settlement' then
								counters[desc].Counter.decrement()
            elseif name == 'City' then
                counters[desc].Counter.decrement()
								counters[desc].Counter.decrement()
            end
        elseif desc == '1 Victory Point!' then
            for color, area in pairs(zones) do
                if area == zone then
                    if not object.getVar("inZone")
                        then counters[color].Counter.decrement()
                    end
                    VP_cards[object.getGUID()] = nil
                    object.setVar("active", nil)
                    object.setVar("inZone", false)
                end
            end
        elseif name == 'Largest Army' or name == 'Longest Road' then
						for color, area in pairs(zones) do
					  		if area == zone then
										counters[color].Counter.decrement()
										counters[color].Counter.decrement()
								end
					  end
        end
    end
end


function filterObjectEnterContainer(container, object)
    con = container.getDescription()
    obj = object.getDescription()
    if obj == "1 Victory Point!" and object.getVar("inZone") then
        return false
    elseif con == "1 Victory Point!" and container.getVar("inZone") then
        return false
    end
    return true
end

function beginnerSetup()
    extensionEnabled = false
    randomHarbors = false
    randomChits = false
    chitsFog = false
    autoVP = true
    beginner = true
    createBoard()
end


function enableExtension()
    local button_parameters = {}
    button_parameters.index = 1
    if extensionEnabled then
        button_parameters.label = '3 - 4'
        menuBoard.editButton( button_parameters )
        extensionEnabled = false
    else
        button_parameters.label = '5 - 6'
        menuBoard.editButton( button_parameters )
        extensionEnabled = true
    end
end


function randomizeHarbors()
    local button_parameters = {}
    button_parameters.index = 2
    if randomHarbors then
        button_parameters.label = 'Standard'
        menuBoard.editButton( button_parameters )
        randomHarbors = false
    else
        button_parameters.label = 'Random'
        menuBoard.editButton( button_parameters )
        randomHarbors = true
    end
end


function randomizeChits()
    local button_parameters = {}
    button_parameters.index = 3
    if chitsFog then
        button_parameters.label = 'Standard'
        menuBoard.editButton( button_parameters )
        randomChits = false
        chitsFog = false
    else
        if randomChits then
            button_parameters.label = 'Random + Fog'
            menuBoard.editButton( button_parameters )
            chitsFog = true
        else
            button_parameters.label = 'Random'
            menuBoard.editButton( button_parameters )
            randomChits = true
        end
    end
end


function changeAutoVP()
    local button_parameters = {}
    button_parameters.index = 4
    if autoVP == true then
        button_parameters.label = 'Disabled'
        menuBoard.editButton( button_parameters )
        autoVP = false
    else
        button_parameters.label = 'Enabled'
        menuBoard.editButton( button_parameters )
        autoVP = true
    end
end


function autoVPcards()
    for card, color in pairs( VP_cards ) do
        local object = getObjectFromGUID(card)
        if not object.getVar("active") then
            if object.resting and not object.is_face_down then
                counters[color].Counter.increment()
                object.setVar("active", true)
            end
        end
        if object.getVar("active") then
            if not object.resting or object.is_face_down then
                counters[color].Counter.decrement()
                object.setVar("active", nil)
            end
        end
    end
end


function lockBoard()
		for i, tile in ipairs( tileList ) do
        currentTile = tile[1]
        currentTile.setPosition( tile[2] )
        currentTile.setRotation( tile[3] )
        currentTile.lock()
		end
end


function markChits( result )
    if gameStart then
  	   resetChits()
		   if result == 7 then
				   for i = 2, 12, 1 do
				       for k = 1, 3, 1 do
						       local chit = getObjectFromGUID( chitSet[2][i][k] )
						       if chit == nil then break
						       else
								   chit.setScale( {1.5, 1.5, 1.5} )
								   chit.setColorTint( {1.0, 0.65, 0.65} )
						    end
				    end
		    end
		    robber.setScale( {4, 4, 4} )
		    else
		        for i, value in pairs( chitSet[2][result] ) do
                chit = getObjectFromGUID( value )
                if chit.getRotation()[3] < 100 then
				            chit.setScale( {2.0, 3, 2.0} )
				            chit.setColorTint( {0.5, 1.20, 1.5} )
                end
		        end
		    end
    end
end


function resetChits()
		for i = 2, 12, 1 do
				for k = 1, 3, 1 do
						local chit = getObjectFromGUID( chitSet[2][i][k] )
						if chit == nil then break
						else
								chit.setScale( {1.5, 1.5, 1.5} )
								chit.setColorTint( {1, 1, 1} )
						end
				end
		end
		robber.setScale( {3, 3, 3} )
end


function update()
    lockBoard()
    autoVPcards()
		dieSum = dieOne.getValue() + dieTwo.getValue()
		updateStats( dieSum )
		if oldDieSum != dieSum then
				if dieOne.resting and dieTwo.resting then
						oldDieSum = dieSum
						markChits( dieSum )
				end
		end

end


function updateStats( result )
		if ( dieOneRolling or dieTwoRolling ) and dieOne.resting and dieTwo.resting then
				getStatsFromNote()
				stat_score[dieSum] = stat_score[dieSum] + 1
				setStatsInNote()
		end

		dieOneRolling = not dieOne.resting
		dieTwoRolling = not dieTwo.resting
end


function resetStatScore()
	for i = 2, 12, 1 do
		stat_score[i] = 0
	end
end

function getStatsFromNote()
	local text = getNotes()
	local lineSeparator = "\r\n"
	local indexValueSeparator = ": "
	for line in string.gmatch(text, "([^"..lineSeparator.."]+)") do
		local indexValueTable = {}
		for indexValue in string.gmatch(line, "([^"..indexValueSeparator.."]+)") do
			table.insert(indexValueTable, indexValue)
		end
		local index = indexValueTable[1]
		local value = indexValueTable[2]
		stat_score[index + 0] = value + 0
	end
end

function setStatsInNote()
	local text = ""
	for i = 2, 12, 1 do
		text = text .. "\r\n" .. i .. ": " .. stat_score[i]
	end
	setNotes(text)
end