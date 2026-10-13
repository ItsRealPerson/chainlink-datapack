# ==========================================================
# ChainLink Co-op Datapack — Aplicar Inventario de D hacia A
# ==========================================================

data modify storage chainlink:tmp target set value "@a[tag=chainlink_A,gamemode=!spectator]"
execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] run function chainlink:inventory/copy_all_to_partner with storage chainlink:tmp

execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] run data modify storage chainlink:sync da_inv set from entity @s Inventory
execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] run data modify storage chainlink:sync da_equip set from entity @s equipment
