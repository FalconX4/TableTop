function onObjectLeaveContainer(container, object)
  for i,obj in ipairs(self.getObjects()) do
    if (container == obj) then
      object.setLuaScript(CardScript)
    end
  end
end

CardScript = [[DiscardZone_GUID = '96db31'

function onload()
  _discardZone = getObjectFromGUID(DiscardZone_GUID)
  self.addContextMenuItem("Discard", discardCard)
end

function discardCard()
  self.setPosition(_discardZone.getPosition())
  self.setRotation({0,180,0})
end]]