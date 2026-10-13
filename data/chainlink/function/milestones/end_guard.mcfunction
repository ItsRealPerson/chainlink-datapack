# ========================================================
# ChainLink Milestones - End Guard
# Protects the End dimension and destroys End Portals if locked
# ========================================================

# Check if requirement met to unlock End
execute if score #milestones_done chainlink.state >= #milestones_req chainlink.config if score #end_unlocked chainlink.state matches 0 run function chainlink:milestones/unlock_end

# If the End is locked (0), enforce dimensional security
execute if score #end_unlocked chainlink.state matches 0 run function chainlink:milestones/end_guard_enforce
