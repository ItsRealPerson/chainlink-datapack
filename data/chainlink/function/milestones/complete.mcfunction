# ========================================================
# ChainLink Milestones - Complete Milestone
# Macro called with: {id: int, name: string, desc: string, category: string}
# ========================================================

# Mark milestone as completed
$scoreboard players set #m_$(id)_done chainlink.milestones 1

# Execute on_complete effects and announcements
$function chainlink:milestones/on_complete {id:$(id),name:"$(name)",desc:"$(desc)",category:"$(category)"}
