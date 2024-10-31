ColorObjects = { HandIndex = 1, HelperIndex = 2, TunnelIndex = 3, AntIndex = 4 }
BrownColorObjects_GUIDS = {'89f3b3','d564ac','31c176','160050'}
RedColorObjects_GUIDS = {'ed0304','099201','79605c','b5af3a'}
TealColorObjects_GUIDS = {'8c962b','4ce3ba','fb7db9','797471'}
WhiteColorObjects_GUIDS = {'92a441','d93bd4','c88ebc','b7ac8e'}
PlayerObjects_GUIDS = { Brown = BrownColorObjects_GUIDS, Red = RedColorObjects_GUIDS, Teal = TealColorObjects_GUIDS, White = WhiteColorObjects_GUIDS }

Board_GUID = '289e88'
CrystalBag_GUID = 'c8d53e'
LeafBag_GUID = 'ee71d4'
EggplantBag_GUID = '790d07'
CornBag_GUID = '0a2c42'
LarvaBag_GUID = '512ac2'
RockBag_GUID = '256d38'

Spider1_GUID = '9fd66e'
Spider2_GUID = '23b723'
DiceDirection_GUID = '252d9d'
DiceHex_GUID = '6e2e5e'
DiceFood_GUID = '4fb344'
DeckZone_GUID = '8a7267'
DiscardZone_GUID = '96db31'

TrashPositions = { {-72,5,72}, {-72,5,72}, {-74,1.15,69}, {-69,1.15,74} }
DefaultPlayerSetupHandPositions = {{-55,5,32}, {55,5,32}, {55,5,-32}, {-55,5,-32}, {0,5,-63}}
DefaultPlayerSetupHandRotations = {{0,120,0},{0,240,0},{0,300,0},{0,60,0}, {0,0,0}}
DefaultPlayerSetupBagTunnelPositions = {{-48,1.15,21}, {42,1.15,31}, {48,1.15,-21}, {-48,1.15,-31}, {6,1.15,-52}}
DefaultPlayerSetupBagAntPositions = {{-42,1.15,31}, {48,1.15,21}, {42,1.15,-31}, {-48,1.15,-21}, {-6,1.15,-52}}
DefaultPlayerSetupStartingTunnelPositions = {{-16.5,1.62,9.5},{16.7,1.62,9.2},{16.7,1.62,-9.2},{-16.7,1.62,-9.2},{-0.2,1.62,-18.4}}
DefaultPlayerSetupStartingTunnelRotations = {{0,31,0},{0,150,0},{0,210,0},{0,330,0},{0,270,0}}
CameraYaw = { 120, 240, 300, 60, 0 }

Seated2PlayersIndexes = {1,3}
Seated3PlayersIndexes = {1,2,5}
Seated4PlayersIndexes = {1,2,3,4}

GameSteps = { None = 0, Setup = 1, StartTurn = 2, CardDiscard = 3, Action = 4, Encounter = 5, Dice = 6, DiceResult = 7, EndTurn = 8 }
_currentGameStep = GameSteps.None
_lastFrameCurrentGameStep = GameSteps.None
_spidersAlive = {}
_playersReadyToStart = {}
_waitID = 0

TEST = true

function onSave()
  local spiders = {}
  for i=1, #_spidersAlive do
    if (_spidersAlive[i] == _spider1) then
      table.insert(spiders, Spider1_GUID)
    else
      table.insert(spiders, Spider2_GUID)
    end
  end
  local state =
  {
    gameStep = _currentGameStep,
    spiders = spiders,
    turns = { turnOrder = Turns.order, currentTurnColor = Turns.turn_color }
  }
  return JSON.encode(state)
end

function onLoad(script_state)
  _board = getObjectFromGUID(Board_GUID)
  _crystalBag = getObjectFromGUID(CrystalBag_GUID)
  _leafBag = getObjectFromGUID(LeafBag_GUID)
  _eggplantBag = getObjectFromGUID(EggplantBag_GUID)
  _cornBag = getObjectFromGUID(CornBag_GUID)
  _larvaBag = getObjectFromGUID(LarvaBag_GUID)
  _rockBag = getObjectFromGUID(RockBag_GUID)
  _spider1 = getObjectFromGUID(Spider1_GUID)
  _spider2 = getObjectFromGUID(Spider2_GUID)
  _diceDirection = getObjectFromGUID(DiceDirection_GUID)
  _diceHex = getObjectFromGUID(DiceHex_GUID)
  _diceFood = getObjectFromGUID(DiceFood_GUID)
  _deckZone = getObjectFromGUID(DeckZone_GUID)
  _discardZone = getObjectFromGUID(DiscardZone_GUID)

  _spider1DefaultPosition = _spider1.getPosition()
  _spider2DefaultPosition = _spider2.getPosition()
  _spider1.addContextMenuItem("Kill", discardSpider)
  _spider2.addContextMenuItem("Kill", discardSpider)

  _playerObjects = {}
  for player, objects_GUIDS in pairs(PlayerObjects_GUIDS) do
    local objects = {}
    for i=1, #objects_GUIDS do
      table.insert(objects, getObjectFromGUID(objects_GUIDS[i]))
    end
    _playerObjects[player] = objects
  end

  local state = JSON.decode(script_state)
  if (state ~= nil and state.gameStep > GameSteps.None) then
    Turns.order = state.turns.turnOrder
    Turns.turn_color = state.turns.currentTurnColor
    Turns.pass_turns = false
    Turns.enable = true
    _currentGameStep = state.gameStep
    for i=1, #state.spiders do
      if (state.spiders[i] == Spider1_GUID) then
        table.insert(_spidersAlive, _spider1)
      else
        table.insert(_spidersAlive, _spider2)
      end
    end
  else
    activateXmlObject("setupButton", "")
  end
    
  return JSON.encode(state)
end

-------------------------------------------------------------
-- Setup

function setup(player)
  local seatedPlayers = getSeatedPlayers()
  if (TEST) then
    seatedPlayers = { 'Brown','White', 'Red' }
  end

  local seatedPlayersCount = #seatedPlayers
  if (seatedPlayersCount <= 1) then
    player.showInfoDialog('This game requires either 2, 3 or 4 seated players')
    return
  end
  
  _crystalBag.setLuaScript(bagScript("Discard", "Crystal"))
  _leafBag.setLuaScript(bagFoodScript("Leaf"))
  _eggplantBag.setLuaScript(bagFoodScript("Eggplant"))
  _cornBag.setLuaScript(bagFoodScript("Corn"))
  _larvaBag.setLuaScript(bagScript("Discard", "Larva"))
  _rockBag.setLuaScript(bagScript("Discard", "Rock"))
  
  _currentGameStep = GameSteps.Setup
  decidePlayerOrder(seatedPlayers, seatedPlayersCount)
  if (seatedPlayersCount == 2) then
    setupPlayers(seatedPlayers, Seated2PlayersIndexes)
  elseif (seatedPlayersCount == 3) then
    setupPlayers(seatedPlayers, Seated3PlayersIndexes)
  elseif (seatedPlayersCount == 4) then
    setupPlayers(seatedPlayers, Seated4PlayersIndexes)
  end

  Turns.order = seatedPlayers
  Turns.turn_color = seatedPlayers[1]
  Turns.pass_turns = false
  Turns.enable = true

  Wait.time(function() _board.call("setupBoard", { playerCount = seatedPlayersCount }) end, 0.3)
  table.insert(_spidersAlive, _spider1)
  deckFromZone(_deckZone).shuffle()
end

function decidePlayerOrder(seatedPlayers, seatedPlayersCount)
  for i = seatedPlayersCount, 2, -1 do
    local j = math.random(i)
    seatedPlayers[i], seatedPlayers[j] = seatedPlayers[j], seatedPlayers[i]
  end
end

function setupPlayers(seatedPlayers, indexes)
  local positions = { DefaultPlayerSetupHandPositions, DefaultPlayerSetupHandPositions, DefaultPlayerSetupBagTunnelPositions, DefaultPlayerSetupBagAntPositions }
  for player, objects in pairs(_playerObjects) do
    if (not tableContains(seatedPlayers, player)) then
      for i = 1, #objects do
        setupPlayerObject(objects[i], TrashPositions[i], {0,0,0}, true, seated)
      end
    end
  end

  for i, seatedPlayer in ipairs(seatedPlayers) do
    local index = indexes[i]
    local objects = _playerObjects[seatedPlayer]
    for j = 1, #objects do
      setupPlayerObject(objects[j], positions[j][index], DefaultPlayerSetupHandRotations[index], false, seatedPlayers)
    end
    
    objects[ColorObjects.HandIndex].UI.setXml(HandXmlScript)
    objects[ColorObjects.AntIndex].setLuaScript(bagScript("Die", "Ant"))
    _board.call("setupStartingTunnel", { index = index, tunnelBag = objects[ColorObjects.TunnelIndex], antBag = objects[ColorObjects.AntIndex], player = seatedPlayer })
    Player[seatedPlayer].lookAt({position = _board.getPosition(), pitch = 90, yaw = CameraYaw[index], distance = 100 })
  end
end

function setupPlayerObject(object, position, rotation, hidden, seatedPlayers)
  object.setPosition(position)
  if (object.tag == "Card") then
    object.setRotation(Vector(rotation) + Vector(0,180,0))
  else
    object.setRotation(rotation)
  end

  if (hidden) then
    object.setInvisibleTo(seatedPlayers)
  end
end

-------------------------------------------------------------
-- Buttons event (except setup)

function ready(player)
  if (tableContains(_playersReadyToStart, player.color)) then
    tableRemove(_playersReadyToStart, player.color)
    UI.setAttribute("readyButton", "text", "Ready("..#_playersReadyToStart.."/"..#Turns.order..")")
  else
    table.insert(_playersReadyToStart, player.color)
    local readyVisible = subtractTables(Turns.order, _playersReadyToStart)
    UI.setAttribute("readyButton", "text", "Ready("..#_playersReadyToStart.."/"..#Turns.order..")")
    UI.setAttribute("readyButton", "visibility", table.concat(readyVisible, "|"))
    UI.setAttribute("cancelReadyButton", "text", "Cancel Ready("..#_playersReadyToStart.."/"..#Turns.order..")")
    UI.setAttribute("cancelReadyButton", "visibility", table.concat(_playersReadyToStart, "|"))
    if (#_playersReadyToStart == #Turns.order) then
      Wait.time(function() start() end, 0.03)
    end
  end
  if (TEST) then
    Wait.time(function() start() end, 0.03)
  end
end

function start()
  _currentGameStep = GameSteps.StartTurn
  deckFromZone(_deckZone).deal(1, Turns.turn_color)
  _board.call("evolveLarva", { player = Turns.turn_color, antBag = _playerObjects[Turns.turn_color][ColorObjects.AntIndex] })
end

function waitDiscardCard()
  _currentGameStep = GameSteps.CardDiscard
  for i,object in ipairs(_playerObjects[Turns.turn_color][ColorObjects.HandIndex].getObjects()) do
    if (object != _playerObjects[Turns.turn_color][ColorObjects.HelperIndex]) then
      object.clearContextMenu()
      object.addContextMenuItem("Discard", endDiscardCardStep)
    end
  end
end

function endDiscardCardStep(player_color, position, obj)
  for i,object in ipairs(_playerObjects[player_color][ColorObjects.HandIndex].getObjects()) do
    if (object != _playerObjects[player_color][ColorObjects.HelperIndex]) then
      object.clearContextMenu()
      object.addContextMenuItem("Discard", discardCard)
    end
  end

  obj.setPosition(_discardZone.getPosition())
  obj.setRotation({0,180,0})
  deckFromZone(_deckZone).deal(1, player_color)
  _currentGameStep = GameSteps.Action
end

function cancelDiscard()
  for i,object in ipairs(_playerObjects[Turns.turn_color][ColorObjects.HandIndex].getObjects()) do
    if (object != _playerObjects[Turns.turn_color][ColorObjects.HelperIndex]) then
      object.clearContextMenu()
      object.addContextMenuItem("Discard", discardCard)
    end
  end

  _currentGameStep = GameSteps.Action
end

function startEncounter()
  _currentGameStep = GameSteps.Encounter
  -- Show possibilities of encounters
end

function endEncounter()
  Player[Turns.turn_color].showConfirmDialog("Are you sure you want to end the encounter? This will start to roll the dices.",
    function (player_color)
      _diceDirection.roll()
      _diceHex.roll()
      _diceFood.roll()
      _currentGameStep = GameSteps.Dice
    end
  )
end

function applyDiceResult()
  local directionValue = _diceDirection.getValue()
  local hexValue = _diceHex.getValue()
  local foodValue = _diceFood.getValue()
  if (foodValue == 1 or foodValue == 6) then
    -- Check if spider and rock at the same time, if yes show confirm box for which to do first
    applyFoodDiceResult(foodValue)
    Wait.time(function() applySpiderResult(directionValue, hexValue) _currentGameStep = GameSteps.EndTurn end, 0.3)
  else
    -- Check if spider and food collide, if yes show confirm box for which to do first
    -- Do food otherwise right away then show spider possibilities
    applyFoodDiceResult(foodValue)
    Wait.time(function() applySpiderResult(directionValue, hexValue) _currentGameStep = GameSteps.EndTurn end, 0.3)
  end
end

function applySpiderResult(directionValue, hexValue)
  if (#_spidersAlive == 0) then
  elseif (#_spidersAlive == 1) then
    local directionQ, directionR = spiderDirection(directionValue, hexValue)
    _board.call("moveSpider", { spider = _spidersAlive[1], q = directionQ, r = directionR })
  end

  if (hexValue == 1 or hexValue == 6) then
    Wait.time(function() _board.call("addNewSpider", { spidersAlive = _spidersAlive }) end, 0.3)
  end
end

function spiderDirection(directionValue, hexValue)
  local distance = hexDiceDistance(hexValue)
  local q = 0
  local r = 0
  if (directionValue == 1) then
    r = -distance
  elseif (directionValue == 2) then
    r = distance
  elseif (directionValue == 3) then
    q = -distance
  elseif (directionValue == 4) then
    q = -distance
    r = distance
  elseif (directionValue == 5) then
    q = distance
  elseif (directionValue == 6) then
    q = distance
    r = -distance
  end
  return q, r
end

function hexDiceDistance(hexValue)
  if (hexValue == 4) then
    return 2
  else
    return 1
  end
end

function showRockPossibilities()
end

function applyFoodDiceResult(value)
    if (value == 2) then
      _board.call("fillEggplant")
    elseif (value == 3) then
      _board.call("fillLeaf")
      _board.call("fillEggplant")
      _board.call("fillCorn")
    elseif (value == 4) then
      _board.call("fillCorn")
    elseif (value == 5) then
      _board.call("fillLeaf")
    end
end

function endTurn()
  Turns.turn_color = Turns.getNextTurnColor()
  start()
end

-------------------------------------------------------------
-- Events

function update()
  if (_lastFrameCurrentGameStep != _currentGameStep) then
    if (_currentGameStep == GameSteps.Setup) then
      deactivateActivateXmlObject("setupButton", "readyButton", "")
      UI.setAttribute("readyButton", "text", "Ready("..#_playersReadyToStart.."/"..#Turns.order..")")
    elseif (_currentGameStep == GameSteps.StartTurn) then
      activateObjectXmlObject(_playerObjects[Turns.turn_color][ColorObjects.HandIndex], "blackBackground", Turns.turn_color)
      activateXmlObject("discardCardText", Turns.turn_color)
      deactivateXmlObject("endTurn")
      deactivateXmlObject("readyButton")
      deactivateXmlObject("cancelReadyButton")
      Wait.time(function() waitDiscardCard() end, 1)
    elseif (_currentGameStep == GameSteps.CardDiscard) then
      activateXmlObject("cancelDiscardButton", Turns.turn_color)
      if (_lastFrameCurrentGameStep != GameSteps.StartTurn) then
        waitDiscardCard()
      end
    elseif (_currentGameStep == GameSteps.Action) then
      deactivateObjectXmlObject(_playerObjects[Turns.turn_color][ColorObjects.HandIndex], "blackBackground")
      deactivateXmlObject("discardCardText")
      deactivateActivateXmlObject("cancelDiscardButton", "startEncounterButton", Turns.turn_color)
    elseif (_currentGameStep == GameSteps.Encounter) then
      deactivateActivateXmlObject("startEncounterButton", "endEncounterButton", Turns.turn_color)
    elseif (_currentGameStep == GameSteps.Dice) then
      deactivateXmlObject("endEncounterButton") -- Wait for dice result done bellow
    elseif (_currentGameStep == GameSteps.DiceResult) then
      applyDiceResult()
    elseif (_currentGameStep == GameSteps.EndTurn) then
      activateXmlObject("endTurn", Turns.turn_color)
    else
      print("Error GameSteps")
    end
  end

  _lastFrameCurrentGameStep = _currentGameStep
  if (_currentGameStep == GameSteps.Dice) then
    if (_diceDirection.resting and _diceHex.resting and _diceFood.resting) then
      _currentGameStep = GameSteps.DiceResult
    end
  end
end

-------------------------------------------------------------
-- Helpers

function deactivateObjectXmlObject(object, xmlObject)
  object.UI.setAttribute(xmlObject, "active", "false")
end

function activateObjectXmlObject(object, xmlObject, color)
  object.UI.setAttribute(xmlObject, "active", "true")
  object.UI.setAttribute(xmlObject, "visibility", color)
end

function deactivateXmlObject(object)
  UI.setAttribute(object, "active", "false")
end

function activateXmlObject(object, color)
  UI.setAttribute(object, "active", "true")
  UI.setAttribute(object, "visibility", color)
end

function deactivateActivateXmlObject(deactivateObject, activateObject, color)
  deactivateXmlObject(deactivateObject)
  activateXmlObject(activateObject, color)
end

function tableContains(tableToCheck, value)
  for i = 1, #tableToCheck do
    if (tableToCheck[i] == value) then
      return true
    end
  end
  return false
end

function tableRemove(tableToCheck, value)
  for i = 1, #tableToCheck do
    if (tableToCheck[i] == value) then
      table.remove(tableToCheck, i)
      return true
    end
  end
  return false
end

function subtractTables(t1, t2)
    local lookup = {}
    for _, value in ipairs(t2) do
        lookup[value] = true
    end

    local result = {}
    for _, value in ipairs(t1) do
        if not lookup[value] then
            table.insert(result, value)
        end
    end

    return result
end

function deckFromZone(zone)
  for i,object in ipairs(zone.getObjects()) do
    if (object.tag == "Deck" or object.tag == "Card") then
      return object
    end
  end
end

function discardCard(player_color, position, obj)
  obj.setPosition(_discardZone.getPosition())
  obj.setRotation({0,180,0})
end

function discardSpider(player_color, position, obj)
  if (obj == _spider1) then
    discardSpiderTo(obj, _spider1DefaultPosition)
  elseif (obj == _spider2) then
    discardSpiderTo(obj, _spider2DefaultPosition)
  end
end

function discardSpiderTo(obj, position)
  obj.setPositionSmooth(position, false, true)
  obj.setRotationSmooth({0,180,0}, false, true)
  for i = 1, #_spidersAlive do
    if (_spidersAlive[i] == obj) then
      table.remove(_spidersAlive, i)
      break
    end
  end
end

function createLarva(params)
  local larva = _larvaBag.takeObject({ flip = false, position = params.position, rotation = params.rotation })
  larva.addTag("LarvaPreparing")
  Wait.time(function() larva.setState(1) end, 1.5)
end

HandXmlScript = '<Button id="blackBackground" image="" color="#000000C0" raycastTarget="false" active="false" visibility="" />'

function bagScript(menuName, tag)
  return [[function onObjectLeaveContainer(container, object)
  if (container == self) then
    object.setLuaScript(Script)
  end
end

Script = [[Bag_GUID = ']].."]]..self.getGUID()..[["..[['

function onload()
  _bag = getObjectFromGUID(Bag_GUID)
  self.addContextMenuItem("]]..menuName..[[", discard)
  self.addTag("]]..tag..[[")
end

function discard()
  local pos = _bag.getPosition()
  self.setPositionSmooth({pos.x, 3.5, pos.z}, false, true)
  self.setRotationSmooth({0,180,0}, false, true)
end
]].."]]"
end

function bagFoodScript(tag)
  return [[function onObjectLeaveContainer(container, object)
  if (container == self) then
    object.setLuaScript(FoodScript)
  end
end

FoodScript = [[Bag_GUID = ']].."]]..self.getGUID()..[["..[['
LarvaBag_GUID = ']]..LarvaBag_GUID..[['

function onload()
  _bag = getObjectFromGUID(Bag_GUID)
  _larvaBag = getObjectFromGUID(LarvaBag_GUID)
  self.addContextMenuItem("Destroy", discard)
  self.addContextMenuItem("Feed", feed)
  self.addTag("]]..tag..[[")
end

function discard()
  local pos = _bag.getPosition()
  self.setPositionSmooth({pos.x, 3.5, pos.z}, false, true)
  self.setRotationSmooth({0,180,0}, false, true)
end

function feed()
  Global.call("createLarva", { position = self.getPosition(), rotation = self.getRotation() })
  discard()
end
]].."]]"
end