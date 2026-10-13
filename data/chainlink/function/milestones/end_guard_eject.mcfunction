# ========================================================
# ChainLink Milestones - End Ejection
# Ejects unauthorized players back to Overworld spawn
# ========================================================

# Teleport back to Overworld safe coordinates
execute in minecraft:overworld run tp @s 0 100 0

# Give Slow Falling to prevent fall damage upon arrival
effect give @s minecraft:slow_falling 10 0 true

# Sensory warning (Titles, Audio, Chat)
title @s times 5 50 15
title @s title {"text":"¡ACCESO DENEGADO!","color":"dark_red","bold":true}
title @s subtitle {"text":"El Nexo del End está sellado por los hitos.","color":"red"}

playsound minecraft:entity.elder_guardian.curse player @s ~ ~ ~ 1.0 0.8
playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.5

tellraw @s [{"text":"[ChainLink] ","color":"dark_purple","bold":true},{"text":"¡Has sido expulsado del End! Completa todos los hitos antes de ingresar. ","color":"red"},{"text":"[Ver Hitos]","color":"yellow","underlined":true,"clickEvent":{"action":"run_command","value":"/function chainlink:milestones/status"}}]
