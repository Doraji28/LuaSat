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
---------------------------------------------------------------------------------------------------------

--[[ 각 자리수와 역과합
while true do
    local a = io.read("*n")
    
    if( a == 0)then
        break
    end

    local b = tostring(a)
    local reverse = string.reverse(b)
    local sum = 0
    
    for i = 1, #b do
   
        local digit = string.sub(b,i,i)
        sum = sum + tonumber(digit) --tonumber = 문자열을 숫자로 다시 바꿔주는 함수
    end

    print(tonumber(reverse), sum)
end

]]


--[[ 소수와 합성수
isPrime = true

for t = 1, 5 do
    local n = io.read("*n")
    
    if(n == 1 )then
        print("number one")
    else
        for i = 2, math.floor(math.sqrt(n)) do
            if(n%i == 0)then
            isPrime = false
            end
        end

        if(isPrime == false)then
        print("prime number")
        else
        print("composite number")
        end
    end

    isPrime = true
end
]]

--[[ 소수 구하기
local function isPrime(x)
    if x < 2 then
        return false
    end

    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then
            return false
        end
    end

    return true
end

local N = io.read("*n")

for t = 1, N do
    local M = io.read("*n")
    local distance = 0

    while true do
        local left = M - distance
        local right = M + distance

        local leftPrime = false
        local rightPrime = false

        if left >= 1 and left <= 1000000 then
            leftPrime = isPrime(left)
        end

        if right >= 1 and right <= 1000000 then
            rightPrime = isPrime(right)
        end

        if distance == 0 and leftPrime then
            print(left)
            break
        elseif leftPrime and rightPrime then
            print(left .. " " .. right)
            break
        elseif leftPrime then
            print(left)
            break
        elseif rightPrime then
            print(right)
            break
        end

        distance = distance + 1
    end
end
]]

--[[소수
local function isPrime(x)
    if x < 2 then
        return false
    end

    for i = 2, math.floor(math.sqrt(x)) do
        if x % i == 0 then
            return false
        end
    end

    return true
end

local M = io.read("*n")
local N = io.read("*n")

local sum = 0
local minPrime = nil

for num = M, N do
    if isPrime(num) then
        sum = sum + num

        if minPrime == nil then
            minPrime = num
        end
    end
end

if minPrime == nil then
    print(-1)
else
    print(sum)
    print(minPrime)
end

]]

--[[소수의 개수

function _2413(a, b)
    local cnt = 0
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
            cnt = cnt + 1
        end
    end
    print(cnt)
end

do
    _2413(10, 100)
end
--]]

--[[이진수

function _2814(binary)
    local result = 0
    local power = 0

    while binary > 0 do
        local digit = binary % 10
        result = result + digit * (2 ^ power)

        binary = math.floor(binary / 10)
        power = power + 1
    end

    print(result)
end

do
    _2814(10101)
end

--]]

--[[10진수를 2, 8, 16로 변환
function _1534(num, base)
    local hexChars = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}

    local result = ""

    while num > 0 do
        local remainder = num % base
        result = hexChars[remainder + 1] .. result
        num = math.floor(num / base)
    end

    print(result)
end

do
    _1534(27, 2)
    _1534(27, 8)
    _1534(27, 16)
end
]]

--[[

function _3106(S, A, B)
    local digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    local decimal = 0

    for i = 1, #S do
        local ch = S:sub(i, i)
        local value = digits:find(ch, 1, true) - 1

        decimal = decimal * A + value
    end

    if decimal == 0 then
        print("0")
        return
    end

    local result = ""

    while decimal > 0 do
        local r = decimal % B
        result = digits:sub(r + 1, r + 1) .. result
        decimal = math.floor(decimal / B)
    end

    print(result)
end

do
    _3106("101010", 2, 16)
    _3106("1B", 16, 2)
    _3106("ZZ", 36, 10)
    _3106("2", 10, 8)
    _3106("2", 10, 10)
    _3106("10", 10, 16)
    _3106("ABC", 16, 8)
end

--]]

--[[

function _4977(n)
    local intPart = math.floor(n)
    local fracPart = n - intPart

    local intBin = ""

    if intPart == 0 then
        intBin = "0"
    else
        while intPart > 0 do
            intBin = (intPart % 2) .. intBin
            intPart = math.floor(intPart / 2)
        end
    end

    local fracBin = ""

    for i = 1, 4 do
        fracPart = fracPart * 2

        if fracPart >= 1 then
            fracBin = fracBin .. "1"
            fracPart = fracPart - 1
        else
            fracBin = fracBin .. "0"
        end
    end

    print(intBin .. "." .. fracBin)
end

do
    _4977(27.625)
end

--]]