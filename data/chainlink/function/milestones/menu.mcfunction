# ========================================================
# ChainLink Milestones - Interactive Config Menu
# ========================================================

tellraw @s ""
tellraw @s {"text":"---------------- [ PANEL DE HITOS CHAINLINK ] ----------------","color":"light_purple","bold":true}
tellraw @s [{"text":"Hitos requeridos para abrir el End: ","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true}]
tellraw @s [{"text":"Seleccionar cuota: ","color":"gray"},{"text":"[ 5 ] ","color":"aqua","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_5"}},{"text":"[ 10 ] ","color":"green","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_10"}},{"text":"[ 15 ] ","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_15"}},{"text":"[ 20 ] ","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_20"}},{"text":"[ 25 ] ","color":"dark_purple","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_25"}},{"text":"[ 30 ]","color":"dark_red","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/set_30"}}]
tellraw @s ""
tellraw @s [{"text":"Acciones de Partida:","color":"gray"}]
tellraw @s [{"text":"  "},{"text":"[🎲 RE-SORTEAR HITOS]","color":"gold","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/roll"}},{"text":"  "},{"text":"[📜 VER HITOS ACTIVOS]","color":"yellow","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/list"}},{"text":"  "},{"text":"[📊 ESTADO]","color":"aqua","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/status"}}]
tellraw @s ""
tellraw @s [{"text":"Herramientas de Administrador:","color":"dark_gray"}]
tellraw @s [{"text":"  "},{"text":"[⏭ Forzar Hito (+1)]","color":"gray","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/force_skip"}},{"text":"  "},{"text":"[🔓 Desbloquear End]","color":"dark_green","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/unlock_end"}},{"text":"  "},{"text":"[🔒 Bloquear End]","color":"red","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/lock_end"}},{"text":"  "},{"text":"[🏆 Probar Victoria]","color":"light_purple","underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:milestones/victory"}}]
tellraw @s {"text":"--------------------------------------------------------------","color":"light_purple","bold":true}
tellraw @s ""
