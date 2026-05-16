--연습문제4-1
local wave = 3
local x, y = 12.5, -8.3
local hp = 100
print(string.format("[Wave 0%d] Enemy spawner at (%.1f, %.1f) - HP: %d]", wave, x, y, hp))   
--연습문제4-2
local text = "Background: #FF0000, Text: #00FF00, Border: #0000FF"
for color in string.gmatch(text, "#%x%x%x%x%x%x") do
    print("color:", color)
end

--연습문제4-3
local parts = {}
for i = 1, 100 do
    parts[i] = tostring(i)
end
local result = table.concat(parts, ", ")
print(result)
--연습문제4-4
local text = "Player[Lv.15] HP:80/100"
local name, level, hp, maxHp = string.match(text, "([%a%d]+)%[Lv%.(%d+)%] HP:(%d+)/(%d+)")
print(name, level, hp, maxHp)