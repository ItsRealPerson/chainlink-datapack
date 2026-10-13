# Sets required milestones to 5
scoreboard players set #milestones_req chainlink.config 5
execute store result bossbar chainlink:progress max run scoreboard players get #milestones_req chainlink.config
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]
tellraw @s [{"text":"[ChainLink] ","color":"dark_purple","bold":true},{"text":"Cantidad de hitos requeridos cambiada a ","color":"gray"},{"text":"5","color":"yellow","bold":true},{"text":". ","color":"gray"},{"text":"[🎲 Re-sortear ahora]","color":"gold","underlined":true,"clickEvent":{"action":"run_command","value":"/function chainlink:milestones/roll"}}]
playsound minecraft:ui.button.click player @s ~ ~ ~ 1.0 1.2
