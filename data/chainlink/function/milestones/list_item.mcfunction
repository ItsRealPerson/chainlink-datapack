# ========================================================
# ChainLink Milestones - Print List Item
# Macro called with: {id: int, name: string, desc: string, category: string}
# ========================================================

# Display if completed
$execute if score #m_$(id)_done chainlink.milestones matches 1 run tellraw @s [{"text":"  [✔] ","color":"green","bold":true},{"text":"$(name)","color":"green","bold":true},{"text":" - ","color":"dark_gray"},{"text":"$(desc)","color":"gray"},{"text":" [$(category)]","color":"dark_green"}]

# Display if pending
$execute if score #m_$(id)_done chainlink.milestones matches 0 run tellraw @s [{"text":"  [✘] ","color":"red","bold":true},{"text":"$(name)","color":"gold","bold":true},{"text":" - ","color":"dark_gray"},{"text":"$(desc)","color":"yellow"},{"text":" [$(category)]","color":"gray"}]
