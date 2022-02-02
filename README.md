# nth_simpleHud
A simple hud without dependency just gta native.

## PREVIEW:
![HUD PREVIEW](https://cdn.discordapp.com/attachments/842450821194711040/898920214920568842/unknown.png)

## Installation:
1. Extract the .zip or open it.
2. Place `nth_simpleHud` into your `resources` folder.
3. Add `ensure nth_simpleHud` to your `server.cfg`

## Requirements:
- FiveM
- That's all

## Special Instructions:
Into `Config.lua` line 9.

```lua
Config.lifeRequest = function()

    --Insert your code here
    
    return 50, 50 --The first is thirst and the seconde is hunger (Attention: This must return a percentage!)
end
```
### Exemple (ESX):
I don't follow that there and need the "math.floor" I'm not testing, if it doesn't work remove it and just leave the "status.getPercent()"
```lua
Config.lifeRequest = function()
    local thirst, hunger = nil, nil

    TriggerEvent('esx_status:getStatus', 'thirst', function(status)
        thirst = math.floor(100-status.getPercent())
    end)

    TriggerEvent('esx_status:getStatus', 'hunger', function(status)
        hunger = math.floor(100-status.getPercent())
    end)

    return thirst, hunger
end
```
