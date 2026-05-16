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