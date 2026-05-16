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