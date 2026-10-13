# ========================================================
# ChainLink Milestones - Initialization
# Sets up scoreboards, bossbar, default state, and loads milestone pool
# ========================================================

# Core Scoreboard objectives
scoreboard objectives add chainlink.state dummy
scoreboard objectives add chainlink.config dummy
scoreboard objectives add chainlink.calc dummy
scoreboard objectives add chainlink.milestones dummy
scoreboard objectives add chainlink.tick_timer dummy
scoreboard objectives add chainlink.dragon minecraft.killed:minecraft.ender_dragon

# Milestone Tracking Stats
scoreboard objectives add cl_k_warden minecraft.killed:minecraft.warden
scoreboard objectives add cl_k_wither minecraft.killed:minecraft.wither
scoreboard objectives add cl_k_elder_g minecraft.killed:minecraft.elder_guardian
scoreboard objectives add cl_k_breeze minecraft.killed:minecraft.breeze
scoreboard objectives add cl_k_evoker minecraft.killed:minecraft.evoker
scoreboard objectives add cl_k_ravager minecraft.killed:minecraft.ravager
scoreboard objectives add cl_k_brute minecraft.killed:minecraft.piglin_brute
scoreboard objectives add cl_k_ghast minecraft.killed:minecraft.ghast
scoreboard objectives add cl_k_blaze minecraft.killed:minecraft.blaze
scoreboard objectives add cl_k_w_skel minecraft.killed:minecraft.wither_skeleton
scoreboard objectives add cl_k_bogged minecraft.killed:minecraft.bogged
scoreboard objectives add cl_k_phantom minecraft.killed:minecraft.phantom
scoreboard objectives add cl_k_witch minecraft.killed:minecraft.witch
scoreboard objectives add cl_k_magma minecraft.killed:minecraft.magma_cube
scoreboard objectives add cl_k_enderman minecraft.killed:minecraft.enderman
scoreboard objectives add cl_k_creeper minecraft.killed:minecraft.creeper
scoreboard objectives add cl_dmg_shield minecraft.custom:minecraft.damage_blocked_by_shield
scoreboard objectives add cl_u_ominous minecraft.used:minecraft.ominous_bottle
scoreboard objectives add cl_breed_anim minecraft.custom:minecraft.animals_bred
scoreboard objectives add cl_eat_cake minecraft.custom:minecraft.eat_cake_slice
scoreboard objectives add cl_play_record minecraft.custom:minecraft.play_record
scoreboard objectives add cl_bell_ring minecraft.custom:minecraft.bell_ring
scoreboard objectives add cl_drink_honey minecraft.used:minecraft.honey_bottle
scoreboard objectives add cl_mine_wheat minecraft.mined:minecraft.wheat

# Config defaults (Default to 10 milestones required if not set)
execute unless score #milestones_req chainlink.config = #milestones_req chainlink.config run scoreboard players set #milestones_req chainlink.config 10

# State defaults
execute unless score #milestones_done chainlink.state = #milestones_done chainlink.state run scoreboard players set #milestones_done chainlink.state 0
execute unless score #end_unlocked chainlink.state = #end_unlocked chainlink.state run scoreboard players set #end_unlocked chainlink.state 0
execute unless score #pool_loaded chainlink.state = #pool_loaded chainlink.state run scoreboard players set #pool_loaded chainlink.state 0

# Bossbar setup
bossbar add chainlink:progress "Hitos de la Racha"
bossbar set chainlink:progress color purple
bossbar set chainlink:progress style notched_10
bossbar set chainlink:progress players @a
bossbar set chainlink:progress visible true

# Synchronize Bossbar values
execute store result bossbar chainlink:progress max run scoreboard players get #milestones_req chainlink.config
execute store result bossbar chainlink:progress value run scoreboard players get #milestones_done chainlink.state
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]

# Load the pool of 80 milestones into NBT storage
function chainlink:milestones/init_pool

# Check if active list is empty; if so, perform initial roll
execute unless score #rolled chainlink.state matches 1 run function chainlink:milestones/roll
