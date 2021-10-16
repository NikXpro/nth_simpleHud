local simpleHudActive, Tpercent, Hpercent = false, 0, 0;

local Defaultdata = { --Dont touch this !
    background = {x = 0.08666,y = 0.801,width = 0.1406,height = 0.01588},
    hunger = {x = 0.1222,y = 0.801001,width = 0.06925,height = 0.008334},
    thirth = {x = 0.05095,y = 0.801001,width = 0.06925,height = 0.008334}
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
            DrawRect(-0.001 + Defaultdata.background.x, -0.001 + Defaultdata.background.y, Defaultdata.background.width, Defaultdata.background.height, 0, 0, 0, 110)

            DrawRect(-0.001 + Defaultdata.hunger.x, -0.001 + Defaultdata.hunger.y, Defaultdata.hunger.width, Defaultdata.hunger.height, Config.Hunger.r, Config.Hunger.g, Config.Hunger.b, 125)
            DrawRect((-0.001 + Defaultdata.hunger.x) + ((Defaultdata.hunger.width * (Hpercent - 0.0688) / 100)/2) - Defaultdata.hunger.width/2, -0.001 + Defaultdata.hunger.y, Defaultdata.hunger.width * (Hpercent - 0.0688) / 100, Defaultdata.thirth.height, Config.Hunger.r, Config.Hunger.g, Config.Hunger.b, 255)

            DrawRect(-0.001 + Defaultdata.thirth.x, -0.001 + Defaultdata.thirth.y, Defaultdata.thirth.width, Defaultdata.thirth.height, Config.Thirth.r, Config.Thirth.g, Config.Thirth.b, 125)
            DrawRect((-0.001 + Defaultdata.thirth.x) + ((Defaultdata.thirth.width * (Tpercent - 0.0688) / 100)/2) - Defaultdata.thirth.width/2, -0.001 + Defaultdata.thirth.y, Defaultdata.thirth.width * (Tpercent - 0.0688) / 100, Defaultdata.thirth.height, Config.Thirth.r, Config.Thirth.g, Config.Thirth.b, 255)
            Citizen.Wait(5)
        end
    end)
end

if Config.LaunchOnResourceStart then
    Citizen.CreateThread(function()
        simpleHud()
    end)    
end
