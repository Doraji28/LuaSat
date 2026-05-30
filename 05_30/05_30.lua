--[[구구단
function _12338(a, b)
if(a > b) then
    for j = a, b, -1 do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
else 
    for j = a, b do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
end
end
do
    _12338(6, 3)
end
--]]

--[[구구단 2
function _12422(a, b)
    if a < 2 or b < 2 or a > 9 or b > 9 then
        print('error')
        return
    end
    if(a > b) then
    for j = a, b, -1 do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
else 
    for j = a, b do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
end
end
do
    _12422(2, 3)
end
--]]

--[[구구단 3

function _12338(a, b)
if(a > b) then
    for j = a, b, -1 do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
else 
    for j = a, b do
        for i = 1, 9 do
            print(j, '*', i, '=', j * i)
        end
        print()
    end
end
end
do
    _12338(6, 3)
end

--]]

--[[구구단 4
function _1291(s, e)
    if s < 2 or s > 9 or e < 2 or e > 9 then
        print("INPUT ERROR!")
        return
    end

    local step = (s <= e) and 1 or -1

    for i = 1, 9 do
        local first = true

        for dan = s, e, step do
            if not first then
                io.write("   ") 
            end

            io.write(string.format("%d * %d = %2d", dan, i, dan * i))
            first = false
        end

        print()
    end
end

do
    _1291(3, 4)
end
--]]

--[[숫자 곱셈
function _1692(a, b)
    local h = math.floor(b / 100)      
    local t = math.floor(b / 10) % 10  
    local o = b % 10
    print(a*o)
    print(a*t)
    print(a*h)
    print(a*b)
end

do
    _1692(472, 432)
end
--]]

--[[숫자의 개수
function _1430(a, b, c)
    local s = a * b * c
    local d = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    print(s)
    while s > 0 do
        local r = s % 10
        d[r] = d[r] + 1
        s = math.floor(s / 10)
    end
    for i = 1, 9 do
        print(d[i])
    end
end
do
    _1430(123, 456, 789)
end
--]]

--[[약수와 배수
function _1071(a)
    local y = {}
    local x = {}
    local t = 1
    local s = 4       
    local yaksuSum = 0
    local baesuSum = 0
    for i = 1, #a do
        if(s % a[i] == 0) then
            print(s, '약수', a[i])
            y[t] = a[i]
            t = t + 1
        end
    end
    t = 1
    for i = 1, #a do
        if(a[i] % s == 0) then
            print(s, '배수', a[i])
            x[t] = a[i]
            t = t + 1
        end
    end
    for i = 1, #y do
         yaksuSum = yaksuSum + y[i]
    end
    print(yaksuSum)
    for i = 1, #x do
        baesuSum = baesuSum + x[i]
    end
    print(baesuSum)
end
do
    a = {1, 2, 3, 4, 5, 6, 7, 8, 9}
    _1071(a)
end
--]]

--[[약수 구하기

function _1402(a, b)
    local yaksu = {}
    local t = 1
    for i = 1, a do
        if(a % i == 0) then
             yaksu[t] = i
             t = t + 1
        end
    end
    if(t < b) then
        print('0')
    
    else
        print(yaksu[b])
    end
end

do
    _1402(12, 3)
end

--]]

--[[약수

function _2809(a)
    local yaksu = {}
    local t = 1
    for i = 1, a do
        if(a % i == 0) then
             yaksu[t] = i
             t = t + 1
        end
    end
    for i = 1, #yaksu do
        print(yaksu[i])
    end
end
do
    _2809(24)
end

--]]

--[[최대공약수, 최소공배수

function _1658(a , b)
    local bestYaksu = 0
    local lessBaesu = 0

    for i = 1, a do
        if(a % i == 0 and b % i == 0) then
             bestYaksu = i
        end
    end
    lessBaesu = a * b / bestYaksu
    print(bestYaksu)
    print(lessBaesu)
end
do 
    _1658(24, 18)
end
--]]

--[[최대공약수, 최소공배수
function gcd_get(gcd, n)
    local bestYaksu = 0
    for i = 1, n do
        if(gcd % i == 0 and n % i == 0) then
            bestYaksu = i
        end
    end
    return bestYaksu
end

function _1002(a)
    local bestYaksu = 0
    local lessBaesu = 2
    for i=1, #a do
        local gcd_value = gcd_get(bestYaksu, a[i])
        bestYaksu = gcd_value
        lessBaesu = lessBaesu * a[i] / bestYaksu
    end
    print(bestYaksu)
    print(lessBaesu)
end

do
    a = {2, 8, 10}
    _1002(a)
end

--]]

--[[연필공장

function _5545(a)
    local k = a[1]
    local v = a[2]
    local m = a[3]
    local dosaek = 0
    local guangTaek = 0
    local dosaekguangTaek = 0
    k = k +1
    v = v +1
    
    for i = 1, m do
        if(i % k == 0) then
            dosaek = dosaek + 1
        end
        if(i % v == 0) then
            guangTaek = guangTaek + 1
        end
    end

    for i = 1, m do
        if(i % k == 0 and i % v == 0) then
            dosaekguangTaek = dosaekguangTaek + 1
        end
    end
    local success = m - dosaek - guangTaek + dosaekguangTaek
    local dosaekfail = dosaek - dosaekguangTaek
    local guangTaekfail = guangTaek - dosaekguangTaek
    print(success)
    print(dosaekguangTaek)
    print(guangTaekfail)
    print(dosaekfail)
    
end

do
    local a = {3, 5, 17}
    _5545(a)
end

--]]

---[[소수의 개수

function _2413(a, b)
    for i = a, b do
        local isPrime = true
        if i < 2 then
            isPrime = false
        else
            for j = 2, math.sqrt(i) do
                if i % j == 0 then
                    isPrime = false
                    break
                end
            end
        end

        if isPrime then
            print(i)
        end
    end
end

do
    _2413(10, 100)
end
--]]
