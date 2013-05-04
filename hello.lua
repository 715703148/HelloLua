
-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)

    local cclog = function(...)
        print(string.format(...))
    end

    require "hello2"
    cclog("result is " .. myadd(3, 5))

    ---------------

    -- create MyLayer
    local function createMyLayer()
    	local myLayer = CCLayer:create()
    	
        local bg = CCSprite:create("dog.png")
        bg:setPosition(100,100)
        myLayer:addChild(bg)

        local opSprite = OPSprite:createOPSprite("dog.png")
        opSprite:setPosition(240,160)
        myLayer:addChild(opSprite)

    	return myLayer
    end

    -- run
    local sceneGame = CCScene:create()
    sceneGame:addChild(createMyLayer())
    CCDirector:sharedDirector():runWithScene(sceneGame)
end

xpcall(main, __G__TRACKBACK__)
