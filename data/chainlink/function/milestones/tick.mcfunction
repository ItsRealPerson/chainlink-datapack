# ========================================================
# ChainLink Milestones - Tick Loop
# Called every tick from the root tick runner
# ========================================================

# Increment milestone tick counter
scoreboard players add #tick_counter chainlink.tick_timer 1

# 1. Guard the End Portal & Dimension
function chainlink:milestones/end_guard

# 2. Check for Ender Dragon defeat
execute as @a[scores={chainlink.dragon=1..}] at @s run function chainlink:milestones/victory

# 3. Check active milestones every 20 ticks (1 second)
execute if score #tick_counter chainlink.tick_timer matches 20.. run function chainlink:milestones/tick_second

# Keep Bossbar visible for all players
execute if score #tick_counter chainlink.tick_timer matches 10 run bossbar set chainlink:progress players @a
