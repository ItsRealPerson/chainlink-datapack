# ========================================================
# ChainLink Milestones - Milestone Completion Handler
# Macro function called with: {id: int, name: string, desc: string, category: string}
# ========================================================

# Announce to all players in chat
tellraw @a ""
tellraw @a [{"text":"========================================","color":"dark_green"}]
$tellraw @a [{"text":" ★ HITO COMPLETADO: ","color":"green","bold":true},{"text":"$(name)","color":"gold","bold":true},{"text":" [$(category)]","color":"gray"}]
$tellraw @a [{"text":"   ↳ ","color":"dark_gray"},{"text":"$(desc)","color":"yellow"}]
tellraw @a [{"text":"========================================","color":"dark_green"}]
tellraw @a ""

# Play triumph sounds
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.2
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.0

# Increment completed milestone counter
scoreboard players add #milestones_done chainlink.state 1

# Update Bossbar
execute store result bossbar chainlink:progress value run scoreboard players get #milestones_done chainlink.state
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]

# Check if all milestones have been completed to unlock End Portal
execute if score #milestones_done chainlink.state >= #milestones_req chainlink.config if score #end_unlocked chainlink.state matches 0 run function chainlink:milestones/unlock_end
