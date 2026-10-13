# ==========================================================
# ChainLink Co-op Datapack — Menú Interactivo de Roles (menu)
# Compatibilidad: Minecraft Java Edition 26.2 y 26.3
# ==========================================================

# 1. Abrir diálogo nativo en Minecraft 26.3
execute as @s run dialog show @s chainlink:main_menu
execute unless entity @s as @a run dialog show @s chainlink:main_menu

# 2. Mensaje en chat como respaldo y confirmación visual
tellraw @a ""
tellraw @a [{"text":"══════════════════════════════════════════","color":"dark_gray","strikethrough":true}]
tellraw @a [{"text":"       ⛓ CHAINLINK CO-OP — TOPOLOGÍA 4P ⛓","color":"gold","bold":true}]
tellraw @a [{"text":"══════════════════════════════════════════","color":"dark_gray","strikethrough":true}]
tellraw @a [{"text":" • ","color":"dark_gray"},{"text":"A ↔ B: ","color":"red","bold":true},{"text":"Comparten SALUD en tiempo real","color":"gray"}]
tellraw @a [{"text":" • ","color":"dark_gray"},{"text":"B ↔ C: ","color":"gold","bold":true},{"text":"Comparten INVENTARIO 1:1 en tiempo real","color":"gray"}]
tellraw @a [{"text":" • ","color":"dark_gray"},{"text":"C ↔ D: ","color":"green","bold":true},{"text":"Comparten SALUD en tiempo real","color":"gray"}]
tellraw @a [{"text":" • ","color":"dark_gray"},{"text":"D ↔ A: ","color":"aqua","bold":true},{"text":"Comparten INVENTARIO 1:1 en tiempo real","color":"gray"}]
tellraw @a ""
tellraw @a [{"text":" Selecciona tu Rol:","color":"yellow","bold":true}]
tellraw @a [{"text":"   ","color":"white"},{"text":"[ Rol A (Vida B / Inv D) ]","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:roles/assign_a"},"hover_event":{"action":"show_text","value":"Haz clic para unirte como Persona A"}},{"text":"  ","color":"white"},{"text":"[ Rol B (Vida A / Inv C) ]","color":"gold","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:roles/assign_b"},"hover_event":{"action":"show_text","value":"Haz clic para unirte como Persona B"}}]
tellraw @a [{"text":"   ","color":"white"},{"text":"[ Rol C (Vida D / Inv B) ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:roles/assign_c"},"hover_event":{"action":"show_text","value":"Haz clic para unirte como Persona C"}},{"text":"  ","color":"white"},{"text":"[ Rol D (Vida C / Inv A) ]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:roles/assign_d"},"hover_event":{"action":"show_text","value":"Haz clic para unirte como Persona D"}}]
tellraw @a ""
tellraw @a [{"text":" Acciones de Control:","color":"yellow","bold":true}]
tellraw @a [{"text":"   ","color":"white"},{"text":"[ 🎲 Sortear al Azar ]","color":"light_purple","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:roles/random"},"hover_event":{"action":"show_text","value":"Asignar roles aleatoriamente a los 4 jugadores conectados"}},{"text":"  ","color":"white"},{"text":"[ ▶ INICIAR PARTIDA ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:start"},"hover_event":{"action":"show_text","value":"Comenzar la sincronización activa de vida e inventario"}},{"text":"  ","color":"white"},{"text":"[ 🔄 REINICIAR ]","color":"dark_red","bold":true,"click_event":{"action":"run_command","command":"/function chainlink:reset"},"hover_event":{"action":"show_text","value":"Limpiar roles y detener la sincronización"}}]
tellraw @a ""
tellraw @a [{"text":" Acceso GUI: ","color":"gray"},{"text":"[ 🖥 Reabrir Diálogo GUI ]","color":"gold","underlined":true,"click_event":{"action":"run_command","command":"/dialog show @s chainlink:main_menu"},"hover_event":{"action":"show_text","value":"Abrir la ventana gráfica nativa de ChainLink"}},{"text":"  ","color":"white"},{"text":"[ 🏆 Menú de Hitos ]","color":"light_purple","underlined":true,"click_event":{"action":"run_command","command":"/dialog show @s chainlink:milestones_menu"},"hover_event":{"action":"show_text","value":"Abrir la ventana gráfica de hitos"}}]
tellraw @a [{"text":"══════════════════════════════════════════","color":"dark_gray","strikethrough":true}]
tellraw @a ""
