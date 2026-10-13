# ==========================================================
# ChainLink Co-op Datapack — Aplicar Inventario de C hacia B
# ==========================================================

data modify storage chainlink:tmp target set value "@a[tag=chainlink_B,gamemode=!spectator]"
execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] run function chainlink:inventory/copy_all_to_partner with storage chainlink:tmp

execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] run data modify storage chainlink:sync bc_inv set from entity @s Inventory
execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] run data modify storage chainlink:sync bc_equip set from entity @s equipment
