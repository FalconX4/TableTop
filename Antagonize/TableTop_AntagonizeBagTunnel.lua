function onObjectLeaveContainer(container, object)
  if (container == self) then
    object.setLuaScript(TunnelScript)  
  end
end

TunnelScript = [[Bag_GUID = ']]..self.getGUID()..[['

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
  self.setPositionSmooth({pos.x, 3.5, pos.z}, false, true)
  self.setRotationSmooth({0,180,0}, false, true)
end]]