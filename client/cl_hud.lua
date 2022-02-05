local simpleHudActive, Tpercent, Hpercent = false, 0, 0;

local Defaultdata = { --Dont touch this !
    ["top"] = {
        background = {x = 0.08666,y = 0.801,width = 0.1406,height = 0.01588},
        hunger = {x = 0.1222,y = 0.801001,width = 0.06925,height = 0.008334},
        thirth = {x = 0.05095,y = 0.801001,width = 0.06925,height = 0.008334}
    },
    ["bottom"] = {
        background = {x = 0.08666,y = 0.99673,width = 0.1406,height = 0.00397},
        hunger = {x = 0.1222,y = 0.98903,width = 0.06925,height = 0.008334},
        thirth = {x = 0.05095,y = 0.98903,width = 0.06925,height = 0.008334}
    }
    
};

function simpleHud()
    simpleHudActive = not simpleHudActive
    Citizen.CreateThread(function()
        while simpleHudActive do
            Tpercent, Hpercent = Config.lifeRequest()
            Citizen.Wait(1800)
        end
    end)

    Citizen.CreateThread(function()
        while simpleHudActive do
            DrawRect(-0.001 + Defaultdata[Config.Position].background.x, -0.001 + Defaultdata[Config.Position].background.y, Defaultdata[Config.Position].background.width, Defaultdata[Config.Position].background.height, 0, 0, 0, 110)

            DrawRect(-0.001 + Defaultdata[Config.Position].hunger.x, -0.001 + Defaultdata[Config.Position].hunger.y, Defaultdata[Config.Position].hunger.width, Defaultdata[Config.Position].hunger.height, Config.Hunger.r, Config.Hunger.g, Config.Hunger.b, 125)
            DrawRect((-0.001 + Defaultdata[Config.Position].hunger.x) + ((Defaultdata[Config.Position].hunger.width * (Hpercent - 0.0688) / 100)/2) - Defaultdata[Config.Position].hunger.width/2, -0.001 + Defaultdata[Config.Position].hunger.y, Defaultdata[Config.Position].hunger.width * (Hpercent - 0.0688) / 100, Defaultdata[Config.Position].thirth.height, Config.Hunger.r, Config.Hunger.g, Config.Hunger.b, 255)

            DrawRect(-0.001 + Defaultdata[Config.Position].thirth.x, -0.001 + Defaultdata[Config.Position].thirth.y, Defaultdata[Config.Position].thirth.width, Defaultdata[Config.Position].thirth.height, Config.Thirth.r, Config.Thirth.g, Config.Thirth.b, 125)
            DrawRect((-0.001 + Defaultdata[Config.Position].thirth.x) + ((Defaultdata[Config.Position].thirth.width * (Tpercent - 0.0688) / 100)/2) - Defaultdata[Config.Position].thirth.width/2, -0.001 + Defaultdata[Config.Position].thirth.y, Defaultdata[Config.Position].thirth.width * (Tpercent - 0.0688) / 100, Defaultdata[Config.Position].thirth.height, Config.Thirth.r, Config.Thirth.g, Config.Thirth.b, 255)
            Citizen.Wait(5)
        end
    end)
end

if Config.LaunchOnResourceStart then
    Citizen.CreateThread(function()
        simpleHud()
    end)    
end
