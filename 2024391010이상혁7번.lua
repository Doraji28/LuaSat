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