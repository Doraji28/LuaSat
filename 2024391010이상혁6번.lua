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