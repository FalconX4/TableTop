function onload()
  local snapPoints = {}
  local x, z = hex_to_pixel(0, 0)
  table.insert(snapPoints, { position = {x,0,z} })
  x, z = hex_to_pixel(-1, 1)
  table.insert(snapPoints, { position = {x,0,z} })
  x, z = hex_to_pixel(1, 0)
  table.insert(snapPoints, { position = {x,0,z} })
  self.setSnapPoints(snapPoints)
end

function hex_to_pixel(q, r)
  local distance = 1
  local offsetX = -0.4
  local offsetZ = 0
  local x = distance * (math.sqrt(3) * (r + q / 2))
  local z = distance * (3/2 * q)
  return x + offsetX, z + offsetZ
end