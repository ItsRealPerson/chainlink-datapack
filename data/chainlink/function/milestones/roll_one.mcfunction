# ========================================================
# ChainLink Milestones - Roll Single Milestone
# Macro function called with: {index: int}
# ========================================================

# Extract milestone from temporary pool at specified index
$data modify storage chainlink:milestones selected_item set from storage chainlink:milestones temp_pool[$(index)]
$data remove storage chainlink:milestones temp_pool[$(index)]

# Append to active list
data modify storage chainlink:milestones active append from storage chainlink:milestones selected_item

# Activate milestone scores
function chainlink:milestones/activate_selected with storage chainlink:milestones selected_item
