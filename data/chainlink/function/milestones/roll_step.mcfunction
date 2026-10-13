# ========================================================
# ChainLink Milestones - Roll Step
# Selects a uniformly random milestone, pops it from temp_pool, and recurses
# ========================================================

# Generate pseudo-random value
execute store result score #rand_num chainlink.calc run random value 0..999999

# Compute index: #rand_idx = #rand_num % #pool_size
scoreboard players operation #rand_idx chainlink.calc = #rand_num chainlink.calc
scoreboard players operation #rand_idx chainlink.calc %= #pool_size chainlink.calc

# Pass chosen index to macro runner
execute store result storage chainlink:milestones macro_args.index int 1 run scoreboard players get #rand_idx chainlink.calc
function chainlink:milestones/roll_one with storage chainlink:milestones macro_args

# Adjust counters
scoreboard players remove #pool_size chainlink.calc 1
scoreboard players add #rolled_count chainlink.calc 1

# Recurse if needed
execute if score #rolled_count chainlink.calc < #milestones_req chainlink.config if score #pool_size chainlink.calc matches 1.. run function chainlink:milestones/roll_loop
