function onObjectLeaveContainer(container, object)
  if (container == self) then
    object.setLuaScript(FoodScript)
  end
end

FoodScript = [[Bag_GUID = ']]..self.getGUID()..[['
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
  self.setPositionSmooth({pos.x, 3, pos.z}, false, true)
  self.setRotationSmooth({0,180,0}, false, true)
end

function feed()
  local larva = _larvaBag.takeObject({ flip = false, position = self.getPosition(), rotation = self.getRotation() })
  larva.addTag("LarvaPreparing")
  Wait.time(function() larva.setState(1) end, 2)
  discard()
end