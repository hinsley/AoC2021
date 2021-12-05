lines = {}
for line in io.lines("input.txt") do
  lines[#lines + 1] = line
end

-- Part One

horizontal_position = 0
vertical_position = 0

for k, v in pairs(lines) do
  if v:find("^up") ~= nil then
    vertical_position = vertical_position - string.sub(v, #v) -- Last character
  elseif v:find("^down") ~= nil then
    vertical_position = vertical_position + string.sub(v, #v)
  elseif v:find("^forward") ~= nil then
    horizontal_position = horizontal_position + string.sub(v, #v)
  end
end

print("Part One horizontal*vertical final position: " ..
      horizontal_position * vertical_position)

-- Part Two

horizontal_position = 0
vertical_position = 0
aim = 0

for k, v in pairs(lines) do
  if v:find("^up") ~= nil then
    aim = aim - string.sub(v, #v)
  elseif v:find("^down") ~= nil then
    aim = aim + string.sub(v, #v)
  elseif v:find("^forward") ~= nil then
    horizontal_position = horizontal_position + string.sub(v, #v)
    vertical_position = vertical_position + string.sub(v, #v) * aim
  end
end

print("Part Two horizontal*vertical final position: " ..
      horizontal_position * vertical_position)
