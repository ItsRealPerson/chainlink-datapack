# ========================================================
# ChainLink Milestones - Custom Milestone Adder
# Macro called with: {id: int, name: string, desc: string, category: string}
# Adds a new custom milestone into the global pool dynamically
# ========================================================

# Append new compound to storage pool
$data modify storage chainlink:milestones pool append value {id:$(id),name:"$(name)",desc:"$(desc)",category:"$(category)"}

# Update pool size score dynamically
execute store result score #pool_size chainlink.config run data get storage chainlink:milestones pool

# Confirmation feedback
$tellraw @s [{"text":"[ChainLink] ","color":"green","bold":true},{"text":"Nuevo hito registrado en el pool (#$(id)): ","color":"yellow"},{"text":"\"$(name)\"","color":"gold","bold":true},{"text":" [$(category)]","color":"gray"}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
