# ========================================================
# ChainLink Milestones - 1 Second (20 Ticks) Routine
# ========================================================

# Reset tick counter
scoreboard players set #tick_counter chainlink.tick_timer 0

# Check completion conditions for all active milestones
function chainlink:milestones/check_active

# Refresh Bossbar display and participants
bossbar set chainlink:progress players @a
execute store result bossbar chainlink:progress max run scoreboard players get #milestones_req chainlink.config
execute store result bossbar chainlink:progress value run scoreboard players get #milestones_done chainlink.state
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]
