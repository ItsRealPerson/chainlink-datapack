# ==========================================================
# ChainLink Co-op Datapack — Sincronización de Inventario (D ↔ A)
# ==========================================================

# Verificar que ambos jugadores estén presentes y vivos
execute unless entity @a[tag=chainlink_D,gamemode=!spectator] run return 0
execute unless entity @a[tag=chainlink_A,gamemode=!spectator] run return 0

# Inicialización inicial del par D-A si no está sincronizado
execute unless score #da_inited chainlink.state matches 1 run function chainlink:inventory/init_da

# Resetear indicadores de cambio para este tick
scoreboard players set #d_changed chainlink.state 0
scoreboard players set #a_changed chainlink.state 0
scoreboard players set #d_eq_changed chainlink.state 0
scoreboard players set #a_eq_changed chainlink.state 0

# Comprobar cambios en D (Inventario general)
data modify storage chainlink:sync test_inv set from storage chainlink:sync da_inv
execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] store success score #d_changed chainlink.state run data modify storage chainlink:sync test_inv set from entity @s Inventory

# Comprobar cambios en D (Equipamiento adicional)
data modify storage chainlink:sync test_eq set from storage chainlink:sync da_equip
execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] store success score #d_eq_changed chainlink.state run data modify storage chainlink:sync test_eq set from entity @s equipment
execute if score #d_eq_changed chainlink.state matches 1 run scoreboard players set #d_changed chainlink.state 1

# Comprobar cambios en A (Inventario general)
data modify storage chainlink:sync test_inv set from storage chainlink:sync da_inv
execute as @a[tag=chainlink_A,gamemode=!spectator,limit=1] store success score #a_changed chainlink.state run data modify storage chainlink:sync test_inv set from entity @s Inventory

# Comprobar cambios en A (Equipamiento adicional)
data modify storage chainlink:sync test_eq set from storage chainlink:sync da_equip
execute as @a[tag=chainlink_A,gamemode=!spectator,limit=1] store success score #a_eq_changed chainlink.state run data modify storage chainlink:sync test_eq set from entity @s equipment
execute if score #a_eq_changed chainlink.state matches 1 run scoreboard players set #a_changed chainlink.state 1

# 1. Caso: D modificó su inventario -> Espejar hacia A
execute if score #d_changed chainlink.state matches 1 run function chainlink:inventory/apply_d_to_a

# 2. Caso: A modificó su inventario (y D no) -> Espejar hacia D
execute if score #d_changed chainlink.state matches 0 if score #a_changed chainlink.state matches 1 run function chainlink:inventory/apply_a_to_d
