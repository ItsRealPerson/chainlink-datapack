# ========================================================
# ChainLink Milestones - Roll Loop
# Recursively selects milestones until quota is met
# ========================================================

# If more milestones needed and pool has elements, execute roll step
execute if score #rolled_count chainlink.calc < #milestones_req chainlink.config if score #pool_size chainlink.calc matches 1.. run function chainlink:milestones/roll_step
