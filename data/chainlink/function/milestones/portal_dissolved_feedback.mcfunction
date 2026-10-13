# ========================================================
# ChainLink Milestones - Portal Dissolved Feedback
# Triggered when an active End Portal block is dissolved
# ========================================================

title @s actionbar {"text":"¡El Portal del End está sellado! Completa todos los hitos primero (/function chainlink:milestones/status)","color":"gold","bold":true}
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1.0 1.2
playsound minecraft:block.fire.extinguish player @s ~ ~ ~ 1.0 0.6
particle minecraft:reverse_portal ~ ~1 ~ 0.5 0.5 0.5 0.1 50

tellraw @s [{"text":"[ChainLink] ","color":"dark_purple","bold":true},{"text":"¡El Portal del End está sellado! Completa todos los hitos primero. ","color":"red"},{"text":"[Ver Hitos]","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/status"}}]
