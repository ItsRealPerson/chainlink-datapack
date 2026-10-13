# ========================================================
# ChainLink Milestones - Roll Active Milestones
# Randomly selects #milestones_req unique milestones from the pool
# ========================================================

# Reset active milestone states and scores
scoreboard players reset * chainlink.milestones
scoreboard players set #milestones_done chainlink.state 0
scoreboard players set #end_unlocked chainlink.state 0
scoreboard players set #rolled chainlink.state 1

# Reset milestone tracking stats on players for a fresh match roll
scoreboard players reset * cl_k_warden
scoreboard players reset * cl_k_wither
scoreboard players reset * cl_k_elder_g
scoreboard players reset * cl_k_breeze
scoreboard players reset * cl_k_evoker
scoreboard players reset * cl_k_ravager
scoreboard players reset * cl_k_brute
scoreboard players reset * cl_k_ghast
scoreboard players reset * cl_k_blaze
scoreboard players reset * cl_k_w_skel
scoreboard players reset * cl_k_bogged
scoreboard players reset * cl_k_phantom
scoreboard players reset * cl_k_witch
scoreboard players reset * cl_k_magma
scoreboard players reset * cl_k_enderman
scoreboard players reset * cl_k_creeper
scoreboard players reset * cl_dmg_shield
scoreboard players reset * cl_u_ominous
scoreboard players reset * cl_breed_anim
scoreboard players reset * cl_eat_cake
scoreboard players reset * cl_play_record
scoreboard players reset * cl_bell_ring
scoreboard players reset * cl_drink_honey
scoreboard players reset * cl_mine_wheat

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
tellraw @a [{"text":"Usa ","color":"gray"},{"text":"[📜 Ver Hitos Activos]","color":"yellow","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/list"}},{"text":" para consultar los objetivos.","color":"gray"}]
tellraw @a ""

playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.0 1.0
