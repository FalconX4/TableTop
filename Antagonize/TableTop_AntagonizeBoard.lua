--[[
                  -2, 5        0, 4        2, 3
            -3, 5       -1, 4        1, 3        3, 2
                  -2, 4        0, 3        2, 2
            -3, 4       -1, 3        1, 2        3, 1
      -4, 4       -2, 3        0, 2        2, 1        4, 0
            -3, 3       -1, 2        1, 1        3, 0
      -4, 3       -2, 2        0, 1        2, 0        4,-1
-5, 3       -3, 2       -1, 1        1, 0        3,-1        5, -2
      -4, 2       -2, 1        0, 0        2,-1        4,-2
-5, 2       -3, 1       -1, 0        1,-1        3,-2        5, -3
      -4, 1       -2, 0        0,-1        2,-2        4,-3
            -3, 0       -1,-1        1,-2        3,-3
      -4, 0       -2,-1        0,-2        2,-3        4,-4
            -3,-1       -1,-2        1,-3        3,-4
                  -2,-2        0,-3        2,-4
            -3,-2       -1,-3        1,-4        3,-5
                  -2,-3        0,-4        2,-5
]]--

Spider1_GUID = '9fd66e'
Spider2_GUID = '23b723'
CrystalBag_GUID = 'c8d53e'
LeafBag_GUID = 'ee71d4'
EggplantBag_GUID = '790d07'
CornBag_GUID = '0a2c42'
LarvaBag_GUID = '512ac2'

DefaultPlayerSetupStartingTunnelHexes = {{5,-5},{-5,0},{-5,5},{5,0},{0,5}}
DefaultPlayerSetupStartingTunnelPositions = {{-16.5,1.62,9.5},{16.7,1.62,9.2},{16.7,1.62,-9.2},{-16.7,1.62,-9.2},{-0.2,1.62,-18.4}}
DefaultPlayerSetupStartingTunnelRotations = {{0,31,0},{0,150,0},{0,210,0},{0,330,0},{0,270,0}}

LeafHexes = {{2,-4},{-2,0},{2,0},{-2,4}}
EggplantHexes = {{0,-2},{4,-2},{-4,2},{0,2}}
CornHexes = {{-2,-2},{2,-2},{-2,2},{2,2}}
SpiderHex = Vector(0,0)

_playersAnts = {}
_playersTunnels = {}
_boardSnapPoints = {}

function onload()
  _spider1 = getObjectFromGUID(Spider1_GUID)
  _spider2 = getObjectFromGUID(Spider2_GUID)
  _crystalBag = getObjectFromGUID(CrystalBag_GUID)
  _leafBag = getObjectFromGUID(LeafBag_GUID)
  _eggplantBag = getObjectFromGUID(EggplantBag_GUID)
  _cornBag = getObjectFromGUID(CornBag_GUID)
  _larvaBag = getObjectFromGUID(LarvaBag_GUID)
  loadBoardSnapPoints()
end

function loadBoardSnapPoints()
  local radius = 5
  for q = -radius, radius do
    local r1 = math.max(-radius, -q - radius)
    local r2 = math.min(radius, -q + radius)
    for r = r1, r2 do
      if (canAdd(q,r)) then
        local x, z = hexToPixel({ q = q, r = r })
        table.insert(_boardSnapPoints, { tilePosition = Vector(q,0,r) , boardPosition = Vector(x,0,z), worldPosition = boardToWorldPosition(x, z) })
      end
    end
  end
end

function canAdd(q, r)
  local absQ = math.abs(q)
  local absR = math.abs(r)
  if ((absQ == 5 and absR != 2 and absR != 3) or (absR == 5 and absQ != 2 and absQ != 3)) then
    return false
  elseif ((q == -1 and r == -4) or (q == -4 and r == -1) or (q == 1 and r == 4) or (q == 4 and r == 1)) then
    return false
  else
    return true
  end
end

function hexToPixel(params)
  local distance = 0.2275
  local x = distance * (3/2 * params.q)
  local z = distance * (math.sqrt(3) * (params.r + params.q / 2))
  return x, z
end

function pixelToHex(params)
  local distance = 0.2275
  local q = (2/3) * (params.x / distance)
  local r = (params.z / (math.sqrt(3) * distance)) - (q / 2)
  return q, r
end

-------------------------------------------------------------
-- setup

function setupStartingTunnel(params)
    local tunnelPosition = Vector(DefaultPlayerSetupStartingTunnelPositions[params.index])
    local tunnelRotation = Vector(DefaultPlayerSetupStartingTunnelRotations[params.index])
    local tunnel = params.tunnelBag.takeObject({ flip = false, position = tunnelPosition, rotation = tunnelRotation})
    tunnel.setLuaScript(StartingTunnelScript)
    _playersTunnels[params.player] = { tunnel }
    params.tunnelBag.setLuaScript(bagTunnelScript("Destroy"))
    Wait.time(function() setupAnts(params.antBag, params.player, tunnel, tunnelPosition, tunnelRotation) end, 0.3)
end

function setupAnts(antBag, player, tunnel, position, rotation)
  local tunnelScale = tunnel.getScale()
  local antRotation = rotation + Vector(0,-90,0)
  local x, z = tunnel.call("hexToPixel", { q = 0, r = 0 })
  _playersAnts[player] = {}
  table.insert(_playersAnts[player], antBag.takeObject({ flip = false, position = position + Vector(x * tunnelScale.x, 1, z * tunnelScale.z):rotateOver('y', rotation.y), rotation = antRotation}))
  x, z = tunnel.call("hexToPixel", { q = -1, r = 1 })
  table.insert(_playersAnts[player], antBag.takeObject({ flip = false, position = position + Vector(x * tunnelScale.x, 1, z * tunnelScale.z):rotateOver('y', rotation.y), rotation = antRotation}))
  x, z = tunnel.call("hexToPixel", { q = 0, r = 1 })
  table.insert(_playersAnts[player], antBag.takeObject({ flip = false, position = position + Vector(x * tunnelScale.x, 1, z * tunnelScale.z):rotateOver('y', rotation.y), rotation = antRotation}))
  x,z = tunnel.call("hexToPixel", { q = 1, r = 0 })
  table.insert(_playersAnts[player], antBag.takeObject({ flip = false, position = position + Vector(x * tunnelScale.x, 1, z * tunnelScale.z):rotateOver('y', rotation.y), rotation = antRotation}))
end

function evolveLarva(params)
  local scale = self.getScale()
  for i=1, #_playersTunnels[params.player] do
    local tunnel = _playersTunnels[params.player][i]
    local tunnelPosition = tunnel.getPosition()
    local tunnelRotation = tunnel.getRotation()
    local tunnelScale = tunnel.getScale()
    local snapPoints = tunnel.getSnapPoints()
    for j=1, #snapPoints do
      local checkedPosition = tunnelPosition + Vector(snapPoints[j].position.x * tunnelScale.x, 1, snapPoints[j].position.z * tunnelScale.z):rotateOver('y', tunnelRotation.y)
      local hits = getHits(checkedPosition)
      if (#hits == 1) then
        if (hits[1].hit_object.hasTag("LarvaPreparing")) then
          local newState = hits[1].hit_object.setState(2)
          newState.addTag("LarvaReady")
          newState.removeTag("LarvaPreparing")
        elseif (hits[1].hit_object.hasTag("LarvaReady")) then
          hits[1].hit_object.removeTag("LarvaReady")
          hits[1].hit_object.call("discard")
          params.antBag.takeObject({ flip = false, position = checkedPosition, rotation = tunnelRotation + Vector(0,-90,0)})
        end
      end
    end
  end
end

-------------------------------------------------------------
-- Fill Board

function setupBoard(params)
  setupSnapPointsAndXml()
  fillCrystal(params.playerCount)
  fillLeaf()
  fillEggplant()
  fillCorn()
  addNewSpider({ spidersAlive = {} })
end

function setupSnapPointsAndXml()
  local xmlScript = ""
  local snapPoints = {}
  local radius = 5
  for i=1, #_boardSnapPoints do  
    table.insert(snapPoints, _boardSnapPoints[i].boardPosition)
    xmlScript = xmlScript .. tileXmlScript(-_boardSnapPoints[i].tilePosition.x, -_boardSnapPoints[i].tilePosition.z, _boardSnapPoints[i].boardPosition.x, _boardSnapPoints[i].boardPosition.z)
  end
  self.setSnapPoints(snapPoints)
  self.UI.setXml(xmlScript)
end

function fillCrystal(playerCount)
  if (playerCount == 2) then
    takeManyFromBag(_crystalBag, {{1,-1}, {-1,1}})
  elseif (playerCount == 3) then
    takeManyFromBag(_crystalBag, {{1,-1}, {-1,0}, {0,1}})
  elseif (playerCount == 4) then
    takeManyFromBag(_crystalBag, {{1,-1}, {-1,0}, {-1,1}, {1,0}})
  else
    print("Error crystal")
  end
end

function fillLeaf()
  takeManyFromBag(_leafBag, LeafHexes)
end

function fillEggplant()
  takeManyFromBag(_eggplantBag, EggplantHexes)
end

function fillCorn()
  takeManyFromBag(_cornBag, CornHexes)
end

function showRockPlacements()
  highlightEmpty(findAllHexes(), true)
end

function addRock(button)
  takeFromBag(_rockBag, button.getPosition())
end

function addNewSpider(params)
  local spiderSpawnPosition = tileToWorldPosition(SpiderHex.x, SpiderHex.y)
  if (#params.spidersAlive == 2 or hasHits(spiderSpawnPosition)) then
    return
  end

  if (#params.spidersAlive == 0) then
    _spider1.setPositionSmooth(spiderSpawnPosition, false, true)
  else
    if (params.spidersAlive[1] == _spider1) then
      _spider2.setPositionSmooth(spiderSpawnPosition, false, true)
    else
      _spider1.setPositionSmooth(spiderSpawnPosition, false, true)
    end
  end
end

function moveSpider(params)
  local q, r = worldToTilePosition(params.spider.getPosition())
  local finalPosition = tileToWorldPosition(q + params.q, r + params.r)
  local hits = getHits(finalPosition)
  for i=1, #hits do
    if (hits[i].hit_object.hasTag("Ant")) then
      hits[i].hit_object.call("discard")
      Wait.time(function() Global.call("createLarva", {position = finalPosition, rotation = {0, 180, 0}}) end, 1)
    end
  end
  params.spider.setPositionSmooth(finalPosition, false, true)
end

-------------------------------------------------------------
-- Highlights

function addHighlight(q, r, color, isButton)
  self.UI.setAttribute(q..' '..r, "active", "true")
  local colors = getOtherColorsInHighlight(q, r, color)
  table.insert(colors, color)
  self.UI.setAttribute(q..' '..r, "visibility", table.concat(colors, "|"))
  self.UI.setAttribute(q..' '..r, "raycastTarget", (isButton == true and "true" or "false"))
end

function removeHighlight(q, r, color)
  self.UI.setAttribute(q..' '..r, "active", "false")
  local colors = getOtherColorsInHighlight(q, r, color)
  tableRemove(colors, color)
  self.UI.setAttribute(q..' '..r, "visibility", table.concat(colors, "|"))
end

function addHighlights(params, isButton)
  for i=1, #params.hexes do
    addHighlight(params.hexes[i].x, params.hexes[i].z, params.color, isButton)
  end
end

function removeHighlights(params)
  for i=1, #params.hexes do
    removeHighlight(params.hexes[i].x, params.hexes[i].z, params.color)
  end
end

function removeAllHighlights(color)
  for i=1, #_boardSnapPoints do
    removeHighlight(_boardSnapPoints[i].tilePosition.x, _boardSnapPoints[i].tilePosition.z, color)
  end
end

function getOtherColorsInHighlight(q, r, color)
  local colorsData = self.UI.getAttribute(q..' '..r, "visibility")
  local colors = {}
  if (colorsData != nil and colorsData != "") then
    for str in string.gmatch(colorsData,"([^|]*)") do
      if (str != color) then
        table.insert(colors, str)
      end
    end
  end
  return colors
end

function playerAnts(params)
  return _playersAnts[params.color]
end

function highlightAround(params, isButton)
  addHighlights({ hexes = findHexesAround(params.objects), color = params.color }, isButton)
end

function removeHighlightAround(params)
  removeHighlights({ hexes = findAllHexes(), color = params.color })
end

function findHexesAround(objects)
  local hexes = {}
  local objectsQR = {}
  for i=1, #objects do
    local q, r = worldToTilePosition(objects[i].getPosition())
    table.insert(objectsQR, Vector(q,0,r))
  end

  for i=1, #objectsQR do
    local q = objectsQR[i].x
    local r = objectsQR[i].z
    local addingQRs = { Vector(q,0,r-1),Vector(q,0,r+1),Vector(q-1,0,r),Vector(q+1,0,r),Vector(q-1,0,r+1),Vector(q+1,0,r-1) }
    local strippedQRs = {}
    for j=1, #addingQRs do
      if (not tableContains(objectsQR, addingQRs[j])) then
        table.insert(strippedQRs, addingQRs[j])
      end
    end
    concatTables(hexes, strippedQRs)
  end
  return hexes
end

function findAllHexes()
  local hexes = {}
  for i=0, #_boardSnapPoints do
    table.insert(hexes, _boardSnapPoints[i].tilePosition)
  end
  return hexes
end

function highlightEmpty(playerColor, isButton)
  local hexes = {}
  for i=0, #_boardSnapPoints do
    if (not hasHits(_boardSnapPoints[i].worldPosition)) then
      table.insert(hexes, Vector(_boardSnapPoints[i].tilePosition.x,0,_boardSnapPoints[i].tilePosition.z))
    end
  end

  addHighlights({ hexes = hexesEmtpy, color = playerColor}, isButton)
end

-------------------------------------------------------------
-- Events

_wasHovering = false
_lastHover = ""
_targets = {}

function onObjectHover(player_color, obj)
  if (#self.UI.getXml() == 0) then
    return
  end

  if (obj == nil) then
    if (_wasHovering) then
      cancelHighlight(player_color)
    end
    return
  end

  local objName = obj.getName()
  if (objName != _lastHover) then
    cancelHighlight(player_color)
  end

  if (objName == "Backup") then
    _wasHovering = true
    _lastHover = objName
    _targets = playerAnts({ color = player_color })
    highlightAround({ objects = _targets, color = player_color }, false)
  end
end

function cancelHighlight(playerColor)
    _wasHovering = false
    _lastHover = ""
    removeAllHighlights(playerColor)
    _targets = {}
end

function tileClicked(player, value, id)
  print(id)
end

-------------------------------------------------------------
-- Helper

function concatTables(table1, table2)
  for i=1, #table2 do table.insert(table1, table2[i]) end
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

function takeManyFromBag(bag, hexes)
  local bagCount = #bag.getObjects()
  for i=1, #hexes do
    local pos = tileToWorldPosition(hexes[i][1], hexes[i][2])
    if (bagCount > 0 and not hasHits(pos)) then
      bag.takeObject({position = pos, rotation = {0, 180, 0}})
      bagCount = bagCount - 1
    end
  end
end

function takeFromBag(bag, position)
  if (#bag > 0 and not hasHits(positions[i])) then
    bag.takeObject({position = positions[i], rotation = {0, 180, 0}})
  end
end

function tileToWorldPosition(q, r)
  local x, z = hexToPixel({ q = q, r = r})
  return boardToWorldPosition(x, z)
end

function boardToWorldPosition(x, z)
  local scale = self.getScale()
  return Vector(x * scale.x, 3 * scale.y, z * scale.z)
end

function worldToTilePosition(pos)
  local scale = self.getScale()
  local q, r = pixelToHex({ x = pos.x / scale.x, z = pos.z / scale.z })
  q = math.floor(q + 0.5)
  r = math.floor(r + 0.5)
  return q, r
end

function getHits(pos)
  return Physics.cast({ origin = pos, direction = {0,-1,0}, type = 1, max_distance = 0.75 })
end

function hasHits(pos)
  local hitList = Physics.cast({ origin = pos, direction = {0,-1,0}, type = 1, max_distance = 0.75 })
  return #hitList != 0
end

StartingTunnelScript = [[function onload()
  local snapPoints = {}
  local x, z = hexToPixel({ q = 0, r = 0 })
  table.insert(snapPoints, { position = {x,0,z} })
  x, z = hexToPixel({ q = -1, r = 1 })
  table.insert(snapPoints, { position = {x,0,z} })
  x, z = hexToPixel({ q = 1, r = 0 })
  table.insert(snapPoints, { position = {x,0,z} })
  self.setSnapPoints(snapPoints)
  self.addTag("Tunnel")
end

function hexToPixel(params)
  local distance = 1
  local offsetX = -0.4
  local offsetZ = 0
  local x = distance * (math.sqrt(3) * (params.r + params.q / 2))
  local z = distance * (3/2 * params.q)
  return x + offsetX, z + offsetZ
end]]

function bagTunnelScript(menuName)
  return [[function onObjectLeaveContainer(container, object)
  if (container == self) then
    object.setLuaScript(TunnelScript)  
  end
end

TunnelScript = [[Bag_GUID = ']].."]]..self.getGUID()..[[" ..[['

function onload()
  _bag = getObjectFromGUID(Bag_GUID)

  local snapPoints = {}
  local x, z = hexToPixel({ q = 0, r = 0 })
  table.insert(snapPoints, { position = {x,0,z} })
  x, z = hexToPixel({ q = -1, r = 1})
  table.insert(snapPoints, { position = {x,0,z} })
  self.setSnapPoints(snapPoints)

  self.addContextMenuItem("Destroy", discard)
end

function hexToPixel(params)
  local distance = 1.225
  local offsetX = -0.5
  local offsetZ = 0.9
  local x = distance * (math.sqrt(3) * (params.r + params.q / 2))
  local z = distance * (3/2 * params.q)
  return x + offsetX, z + offsetZ
end

function discard()
  local pos = _bag.getPosition()
  self.setPositionSmooth({pos.x, 3, pos.z}, false, true)
  self.setRotationSmooth({0,180,0}, false, true)
end]] .. "]]"
end

function tileXmlScript(q, r, x, y)
  return '<Image id="'..q..' '..r..'" image="Tile" width="48" height="42" position="'..(x * 100)..' '..(y * 100)..' -21" raycastTarget="false" onClick="tileClicked" active="false" visibility="" />\r\n'
end