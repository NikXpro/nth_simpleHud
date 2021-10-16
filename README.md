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
