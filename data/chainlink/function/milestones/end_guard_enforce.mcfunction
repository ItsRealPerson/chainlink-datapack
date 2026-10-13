# ========================================================
# ChainLink Milestones - Enforce End Dimension Lock
# ========================================================

# 1. Eject any players found in the End dimension
execute as @a at @s if dimension minecraft:the_end run function chainlink:milestones/end_guard_eject

# 2. Block and dissolve End Portals near players in the Overworld
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run function chainlink:milestones/end_guard_overworld
