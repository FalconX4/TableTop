6aaf78 = dcff8a
97fee1 = beb639
514c51 = 7bac8f
760bd9 = c6cc06
528364 = c7b6ea
2ed751 = 7672f0



fireCube_GUID = 'dcff8a'

function onload()
  fireCube = getObjectFromGUID(fireCube_GUID)
end

function changeFireState()
  if (fireCube.AssetBundle.getLoopingEffectIndex() == 0) then
    fireCube.AssetBundle.playLoopingEffect(2)
  else
    fireCube.AssetBundle.playLoopingEffect(0)
  end
  return false
end

function onPlayerAction(player, action, targets)
  if (action == Player.Action.PickUp)
 then
    for _, target in ipairs(targets) do
      if (target.getGUID() == self.getGUID())
 then
        changeFireState()
        return false
      end
    end
  end

  return true
end
