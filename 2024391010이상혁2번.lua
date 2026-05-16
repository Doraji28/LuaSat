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