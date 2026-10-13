# ========================================================
# ChainLink Milestones - Lock End (Admin)
# ========================================================

scoreboard players set #end_unlocked chainlink.state 0
tellraw @a [{"text":"[ChainLink Admin] ","color":"red","bold":true},{"text":"El Portal del End ha sido ","color":"yellow"},{"text":"BLOQUEADO","color":"dark_red","bold":true},{"text":" por un administrador.","color":"yellow"}]
playsound minecraft:block.chest.locked master @a ~ ~ ~ 1.0 0.8
