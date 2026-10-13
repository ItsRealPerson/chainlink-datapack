# ========================================================
# ChainLink Milestones - List Active Milestones
# Displays all active milestones for the current match with progress icons
# ========================================================

tellraw @s ""
tellraw @s {"text":"============= [ HITOS ACTIVOS DE LA PARTIDA ] =============","color":"gold","bold":true}
tellraw @s [{"text":"Progreso del Equipo: ","color":"gray"},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green","bold":true},{"text":" / ","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true},{"text":" completados","color":"gray"}]
tellraw @s ""

# Prepare temporary list for iterative printing
data modify storage chainlink:milestones temp_list set from storage chainlink:milestones active

# Start loop if temp_list has elements
execute if data storage chainlink:milestones temp_list[0] run function chainlink:milestones/list_loop

tellraw @s ""
execute if score #end_unlocked chainlink.state matches 0 run tellraw @s [{"text":"Portal del End: ","color":"gray"},{"text":"[ 🔒 SELLADO ]","color":"red","bold":true},{"text":" - Completa todos los hitos para abrirlo.","color":"gray"}]
execute if score #end_unlocked chainlink.state matches 1.. run tellraw @s [{"text":"Portal del End: ","color":"gray"},{"text":"[ 🔓 LIBERADO ]","color":"green","bold":true},{"text":" - ¡Pueden acceder al End y vencer al dragón!","color":"aqua"}]
tellraw @s {"text":"============================================================","color":"gold","bold":true}
tellraw @s ""
