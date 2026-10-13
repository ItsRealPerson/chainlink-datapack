# ========================================================
# ChainLink Milestones - Roll Active Milestones
# Randomly selects #milestones_req unique milestones from the pool
# ========================================================

# Reset active milestone states and scores
scoreboard players reset * chainlink.milestones
scoreboard players set #milestones_done chainlink.state 0
scoreboard players set #end_unlocked chainlink.state 0
scoreboard players set #rolled chainlink.state 1

# Reset storage lists
data modify storage chainlink:milestones active set value []
data modify storage chainlink:milestones temp_pool set from storage chainlink:milestones pool

# Query available pool count
execute store result score #pool_size chainlink.calc run data get storage chainlink:milestones temp_pool
scoreboard players set #rolled_count chainlink.calc 0

# Execute extraction loop if pool is populated
execute if score #pool_size chainlink.calc matches 1.. run function chainlink:milestones/roll_loop

# Update Bossbar
execute store result bossbar chainlink:progress max run scoreboard players get #milestones_req chainlink.config
execute store result bossbar chainlink:progress value run scoreboard players get #milestones_done chainlink.state
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]

# Broadcast notification
tellraw @a ""
tellraw @a [{"text":"[ChainLink] ","color":"dark_purple","bold":true},{"text":"¡Se han sorteado ","color":"gold"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true},{"text":" hitos aleatorios para esta partida!","color":"gold"}]
tellraw @a [{"text":"Usa ","color":"gray"},{"text":"[📜 Ver Hitos Activos]","color":"yellow","underlined":true,"clickEvent":{"action":"run_command","value":"/function chainlink:milestones/list"}},{"text":" para consultar los objetivos.","color":"gray"}]
tellraw @a ""

playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.0 1.0
