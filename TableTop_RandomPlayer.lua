function onObjectPickUp(colorName, object)
  if (object != self) then
    return
  end
  local seatedPlayers = getSeatedPlayers()
  local colorOne = table.remove(seatedPlayers, math.random(1, #seatedPlayers))
  self.setColorTint(colorOne)
  broadcastToAll(Player[colorOne].steam_name .. " was chosen!", { 1, 1, 1 })
end