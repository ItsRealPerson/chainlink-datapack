# ========================================================
# ChainLink Milestones - Enforce End Dimension Lock
# ========================================================

# 1. Eject any players found in the End dimension
execute in minecraft:the_end as @a at @s run function chainlink:milestones/end_guard_eject

# 2. Block and dissolve End Portals near players in the Overworld
execute in minecraft:overworld as @a[gamemode=!spectator] at @s run function chainlink:milestones/end_guard_overworld
