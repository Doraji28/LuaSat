--[[
-- 연습문제 2-1
print(type(42)) --number
print(type(42.0)) --number
print(type("42")) --string
print(type(nil)) --nil
print(type(true)) --boolean
print(type(print)) --function
print(type({})) --table
print(type(type)) --function

-- 연습문제 2-2
function createBullet(x, y)
    local speed = 500
    local dx = 0
    local dy = -1
    local bullet = {x = x, y = y, speed = speed, dx = dx, dy = dy}
    return bullet
end

--연습문제 2-3
local a,b,c = 10, 20, 30
print(a,b,c)
a, c = c, a
print(a,b,c)

--연습문제 2-4
if 0 then print("A") end --A
if "" then print("B") end --B
if nil then print("C") end 
if false then print("D") end
if 0.0 then print("E") end --E
if "false" then print("F") end --F

--]]

--[[
--연습문제3-1
local enemyType = "slime" --임시
local speed = 100 --임시
if(enemyType == "slime") then
    speed = 50
elseif (enemyType == "bat") then
    speed = 150
elseif (enemyType == "boss") then
    speed = 30
else
    speed = 100
end

--연습문제3-2
for i=1, 20 do
    if(i % 3 == 0) then
        print(i)
    end
end
--연습문제3-3
local a = true and false or "fallback"  --true일때 우측, false인데 or 일경우 우측
local b = true and 0 or "fallback" -- true일때 우측, true인데 or 인경우 좌측
local c = nil and "yes" or "no" --nil은 참이 아니므로 or 연산자에서 우측으로 간다.
print(a, b, c)
--연습문제3-4
for i=0, 9 do
    print(i)
end
--]]

--[[
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
--]]

--[[
--연습문제5-1
local function getPlayerInfo()
    local x = 10
    local y = 10
    local angle = 0
    return x, y, angle
end
local x, y, angle = getPlayerInfo()
--연습문제5-2
local function map(tbl, func)
    local result = {}
    for i,v in ipairs(tbl) do
        result[i] = func(v)
    end
    return result
end
local numbers = {1, 2, 3, 4, 5}
local doubled = map(numbers, function(x) return x * 2 end)

--연습문제5-3
local function makeHealthBar(maxHp)
    local currentHp = maxHp
    local result = {
        damage = function(amount)
            currentHp = math.max(0, currentHp - amount)
        end,
        
        heal = function(amount)
            currentHp = math.min(maxHp, currentHp + amount)
        end,
        
        getPercent = function()
            return (currentHp / maxHp) * 100
        end
    }

    return result
end
--연습문제5-4
local enemy = {hp = 100, name = "Goblin"}

function enemy:takeDamage(amount)
    self.hp = self.hp - amount
    if self.hp <= 0 then
        print(self.name .. " is dead!")
    end
end

enemy:takeDamage(30) 
--]]

--[[
--연습문제6-1
local function addItem(inventory, item)
    table.insert(inventory,addItem)
end
local function removeItem(inventory, index)
    table.remove(inventory, removeItem)
end
local function findItem(inventory, item)
    for i, itemF in ipaits(inventory) do
        if(itemF == item) then 
            return i
        end
    end
    return nil
end
local function printInventory(inventory)
    for i, item in ipairs(inventory) do
        print(i, item)
    end
end
--연습문제6-2
local leaderboard = {
    {name = "Alice", score = 1500},
    {name = "Bob", score = 2300},
    {name = "Charlie", score = 800},
}
table.sort(leaderboard, function(a, b)
return a.score > b.score
end)
for i, player in ipairs(leaderboard) do
    print(player.name .. "(" .. player.score .. ")")
end
--연습문제6-3
local a = {1, 2, 3}
local b = {1, nil, 3}
local c = {x = 1, y = 2, z = 3}
print(#a, #b, #c)
-- a는 정확하게 크기가 3
-- b는 2번째가 nil이지만 3
-- c는 X,Y,C 같은 문자열 키를 #c가 젤수가 없음
--연습문제6-4
local function swapRemove(t, i)
    local length = #t
    t[i] = t[length]
    t[length] = nil
end
--table.remove는 배열의 연속성을 유지하기 위해 51번부터 100번까지의 아이템을 전부 한 칸씩 당겨야한다.O(N)성능
--table.swapRemove는 맨 끝에 있는 아이템을 50번 자리에 덮어씌워버린다.
--순서가 지켜져야 하는 곳에는 swapRemove를 쓰면 안됌
--]]

---[[
--연습문제7-1
local function deepCopy(orig, record)
    if type(orig) ~= "table" then return orig end

    record = record or {}

    if record[orig] then return record[orig] end
    local copy = {}
    record[orig] = copy

    setmetatable(copy, deepCopy(getmetatable(orig), record))

    for k, v in pairs(orig) do
        copy[deepCopy(k, record)] = deepCopy(v, record)
    end
    return copy
end
--연습문제7-2
local parPool = {
    use = {},
    Wait = {}
}
function parPool.get()
    local particle
    if #parPool.Wait > 0 then
        particle = table.remove(parPool.Wait)
    else
        particle = {x = 0, y = 0, vx = 0, vy = 0, life = 0}
    end
    -- 사용 중인 테이블에 집어넣기
    table.insert(parPool.use, particle)
    return particle
end
function parPool.release(particle)
    for i, v in ipairs(parPool.use)do
        if v == particle then
            local lastIndex = #parPool.use
            parPool.use[i] = parPool.use[lastIndex]
            parPool.use[lastIndex] = nil
            break
        end
    end
    table.insert(parPool.Wait, particle)
end
function parPool.updateAll(dt)
    local index = #parPoll.use
    while index > 0 do
        local particle = parPool.use[index]
        particle.life = particle.life - dt
        if particle.life <= 0 then
            local lastIndex = #parPool.use
            parPool.use[index] = parPool.use[lastIndex]
            parPool.use[lastIndex] = nil
            table.insert(parPool.Wait, particle)
        else
            particle.x = particle.x + particle.vx * dt
            particle.y = particle.y + particle.vy * dt
        end
        index = index - 1
    end
end
--연습문제7-3
local function toSet(arr)
    local set = {}
    for _, value in ipairs(arr) do
        set[value] = true
    end
    return set
end

local function union(setA, setB)
    local result = {}
    for key in pairs(setA) do result[key] = true end
    for key in pairs(setB) do result[key] = true end
    return result
end

local function intersection(setA, setB)
    local result = {}
    for key in pairs(setA) do
        if setB[key] then result[key] = true end
    end
    return result
end

local function difference(setA, setB)
    local result = {}
    for key in pairs(setA) do
        if not setB[key] then result[key] = true end
    end
    return result
end
--연습문제7-4
local function safeSet(targetTable, value, ...)
    local path = {...}
    local current = targetTable
    local pathLength = #path
    
    for i = 1, pathLength - 1 do
        local key = path[i]
        if type(current[key]) ~= "table" then
            current[key] = {}
        end
        current = current[key]
    end
    
    local lastKey = path[pathLength]
    current[lastKey] = value
end
--]]