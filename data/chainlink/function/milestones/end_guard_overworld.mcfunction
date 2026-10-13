# ========================================================
# ChainLink Milestones - Overworld Portal Dissolution
# Runs at each player to ensure active End Portals are removed
# ========================================================

# Check and replace End Portal blocks with air in a 9x7x9 volume around player
execute store result score #portal_dissolved chainlink.calc run fill ~-4 ~-3 ~-4 ~4 ~3 ~4 minecraft:air replace minecraft:end_portal

# If any portal block was replaced, warn the player with sound, actionbar and chat
execute if score #portal_dissolved chainlink.calc matches 1.. run function chainlink:milestones/portal_dissolved_feedback
