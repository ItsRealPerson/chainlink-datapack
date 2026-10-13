# ========================================================
# ChainLink Milestones - Admin Force Skip / Complete
# Forces the completion of 1 milestone toward the requirement
# ========================================================

scoreboard players add #milestones_done chainlink.state 1

# Refresh bossbar
execute store result bossbar chainlink:progress value run scoreboard players get #milestones_done chainlink.state
bossbar set chainlink:progress name [{"text":"Progreso del Nexo: ","color":"gold","bold":true},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow"},{"text":" Hitos","color":"gray"}]

# Broadcast notification
tellraw @a [{"text":"[ChainLink Admin] ","color":"red","bold":true},{"text":"Un administrador ha forzado la resolución de un hito. Progreso: ","color":"yellow"},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green","bold":true},{"text":" / ","color":"yellow"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true}]
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1.0 1.0

# Unlock End if condition met
execute if score #milestones_done chainlink.state >= #milestones_req chainlink.config if score #end_unlocked chainlink.state matches 0 run function chainlink:milestones/unlock_end
