# ========================================================
# ChainLink Milestones - Status Check
# Displays an overview of current milestone progress and End status
# ========================================================

tellraw @s ""
tellraw @s {"text":"---------------- [ ESTADO DE HITOS CHAINLINK ] ----------------","color":"light_purple","bold":true}
tellraw @s [{"text":"Progreso del Equipo: ","color":"gray"},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green","bold":true},{"text":" de ","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true},{"text":" requeridos","color":"gray"}]

execute if score #end_unlocked chainlink.state matches 0 run tellraw @s [{"text":"Estado del End: ","color":"gray"},{"text":"[ 🔒 SELLADO ]","color":"red","bold":true},{"text":" - Completa los hitos para abrirlo.","color":"gray"}]
execute if score #end_unlocked chainlink.state matches 1.. run tellraw @s [{"text":"Estado del End: ","color":"gray"},{"text":"[ 🔓 LIBERADO ]","color":"green","bold":true},{"text":" - ¡El portal puede ser encendido y cruzado!","color":"aqua"}]

tellraw @s [{"text":"Opciones: ","color":"gray"},{"text":"[📜 Ver Lista de Hitos]","color":"yellow","underlined":true,"clickEvent":{"action":"run_command","value":"/function chainlink:milestones/list"}},{"text":"  "},{"text":"[⚙ Menú Admin]","color":"gold","underlined":true,"clickEvent":{"action":"run_command","value":"/function chainlink:milestones/menu"}}]
tellraw @s {"text":"----------------------------------------------------------------","color":"light_purple","bold":true}
tellraw @s ""
