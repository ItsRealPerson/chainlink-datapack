# ========================================================
# ChainLink Milestones - Activate Selected Milestone
# Macro function called with: {id: int, name: string, ...}
# ========================================================

$scoreboard players set #m_$(id)_active chainlink.milestones 1
$scoreboard players set #m_$(id)_done chainlink.milestones 0
