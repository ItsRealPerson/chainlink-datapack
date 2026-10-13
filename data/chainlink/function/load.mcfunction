# ==========================================================
# ChainLink Co-op Datapack — Función de Inicialización (load)
# Compatibilidad: Minecraft Java Edition 26.2 y 26.3
# ==========================================================

# 1. Configuración de Objetivos de Scoreboard
scoreboard objectives add chainlink.state dummy
scoreboard objectives add chainlink.hp dummy
scoreboard objectives add chainlink.deaths deathCount
scoreboard objectives add chainlink.kills playerKillCount

# 2. Constantes Matemáticas
scoreboard players set #100 chainlink.state 100
scoreboard players set #0 chainlink.state 0

# 3. Equipos y Colores para los 4 Roles
team add chainlink_A "Persona A"
team modify chainlink_A color red
team modify chainlink_A prefix {"text":"[A] ","color":"red","bold":true}
team modify chainlink_A friendlyFire false

team add chainlink_B "Persona B"
team modify chainlink_B color gold
team modify chainlink_B prefix {"text":"[B] ","color":"gold","bold":true}
team modify chainlink_B friendlyFire false

team add chainlink_C "Persona C"
team modify chainlink_C color green
team modify chainlink_C prefix {"text":"[C] ","color":"green","bold":true}
team modify chainlink_C friendlyFire false

team add chainlink_D "Persona D"
team modify chainlink_D color aqua
team modify chainlink_D prefix {"text":"[D] ","color":"aqua","bold":true}
team modify chainlink_D friendlyFire false

# 4. Reglas de Juego Fundamentales (Muerte real para penalización de inventario)
gamerule keepInventory false
gamerule minecraft:keep_inventory false

# 5. Inicialización de Almacenamiento NBT de Sincronización
execute unless data storage chainlink:sync bc_inv run data modify storage chainlink:sync bc_inv set value []
execute unless data storage chainlink:sync bc_equip run data modify storage chainlink:sync bc_equip set value {}
execute unless data storage chainlink:sync da_inv run data modify storage chainlink:sync da_inv set value []
execute unless data storage chainlink:sync da_equip run data modify storage chainlink:sync da_equip set value {}

# 6. Valores por Defecto de Salud Compartida (2000 = 20.0 HP)
execute unless score #pair_ab_hp chainlink.state matches 1.. run scoreboard players set #pair_ab_hp chainlink.state 2000
execute unless score #pair_cd_hp chainlink.state matches 1.. run scoreboard players set #pair_cd_hp chainlink.state 2000
scoreboard players set #pair_ab_hp_display chainlink.state 20
scoreboard players set #pair_cd_hp_display chainlink.state 20

# 7. Mensaje de Carga y Bienvenida en Chat
tellraw @a ""
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"Datapack cargado con éxito para MC 26.2/26.3. ","color":"green"}]
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"Haz clic aquí para abrir el ","color":"yellow"},{"text":"[MENÚ DE ROLES]","color":"aqua","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function chainlink:menu"},"hover_event":{"action":"show_text","value":"Haz clic para abrir el menú interactivo"}},{"text":" o escribe /function chainlink:menu","color":"gray"}]
tellraw @a ""
