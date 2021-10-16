# nth_simpleHud
A simple hud without dependency just gta native.

## Installation:
1. Extract th .zip or open it.
2. Place `nth_simpleHud` into your `resources` folder.
3. Add `ensure nth_simpleHud` to your `server.cfg`

## Requirements
- FiveM
- That's all

## Special Instructions
Into `Config.lua` line 9.

```lua
Config.lifeRequest = function()

    --Insert your code here
    

    --Attention: This must return a percentage!
    return 50, 50 --The first is thirst and the seconde is hunger (do not change the order)
end
```
