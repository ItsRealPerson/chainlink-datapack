# ==========================================================
# ChainLink Co-op Datapack — Sincronización de Inventario (B ↔ C)
# ==========================================================

# Verificar que ambos jugadores estén presentes y vivos
execute unless entity @a[tag=chainlink_B,gamemode=!spectator] run return 0
execute unless entity @a[tag=chainlink_C,gamemode=!spectator] run return 0

# Inicialización inicial del par B-C si no está sincronizado
execute unless score #bc_inited chainlink.state matches 1 run function chainlink:inventory/init_bc

# Resetear indicadores de cambio para este tick
scoreboard players set #b_changed chainlink.state 0
scoreboard players set #c_changed chainlink.state 0
scoreboard players set #b_eq_changed chainlink.state 0
scoreboard players set #c_eq_changed chainlink.state 0

# Comprobar cambios en B (Inventario general)
data modify storage chainlink:sync test_inv set from storage chainlink:sync bc_inv
execute as @a[tag=chainlink_B,gamemode=!spectator,limit=1] store success score #b_changed chainlink.state run data modify storage chainlink:sync test_inv set from entity @s Inventory

# Comprobar cambios en B (Equipamiento adicional)
data modify storage chainlink:sync test_eq set from storage chainlink:sync bc_equip
execute as @a[tag=chainlink_B,gamemode=!spectator,limit=1] store success score #b_eq_changed chainlink.state run data modify storage chainlink:sync test_eq set from entity @s equipment
execute if score #b_eq_changed chainlink.state matches 1 run scoreboard players set #b_changed chainlink.state 1

# Comprobar cambios en C (Inventario general)
data modify storage chainlink:sync test_inv set from storage chainlink:sync bc_inv
execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] store success score #c_changed chainlink.state run data modify storage chainlink:sync test_inv set from entity @s Inventory

# Comprobar cambios en C (Equipamiento adicional)
data modify storage chainlink:sync test_eq set from storage chainlink:sync bc_equip
execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] store success score #c_eq_changed chainlink.state run data modify storage chainlink:sync test_eq set from entity @s equipment
execute if score #c_eq_changed chainlink.state matches 1 run scoreboard players set #c_changed chainlink.state 1

# 1. Caso: B modificó su inventario -> Espejar hacia C
execute if score #b_changed chainlink.state matches 1 run function chainlink:inventory/apply_b_to_c

# 2. Caso: C modificó su inventario (y B no) -> Espejar hacia B
execute if score #b_changed chainlink.state matches 0 if score #c_changed chainlink.state matches 1 run function chainlink:inventory/apply_c_to_b
