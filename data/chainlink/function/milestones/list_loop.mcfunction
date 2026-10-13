# ========================================================
# ChainLink Milestones - List Printing Loop
# ========================================================

# Print current head item
execute if data storage chainlink:milestones temp_list[0] run function chainlink:milestones/list_item with storage chainlink:milestones temp_list[0]

# Shift head item
data remove storage chainlink:milestones temp_list[0]

# Continue loop if more items remain
execute if data storage chainlink:milestones temp_list[0] run function chainlink:milestones/list_loop
