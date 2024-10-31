color = ""
oldScore = 0
rabbitSpawned = {}

function onUpdate()
  score = Global.getVar('score' .. color)
  if (oldScore == score) then
    return
  end

  if (oldScore < score) then
    for i = oldScore + 1,score,1 do
      local position = self.getPosition()
      local spawn = self.clone({ position = { position.x + 3.5 + (i - 1) % 5 * 2, position.y, position.z + 3 + math.floor((i - 1) / 5) * 1 } })
      spawn.script_code = ""
      table.insert(rabbitSpawned, spawn)
    end
  else
    for i = oldScore,score,-1 do
      destroyObject(rabbitSpawned[i])
      table.remove(rabbitSpawned)
    end
  end
  oldScore = score
end