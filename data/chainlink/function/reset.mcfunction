# ==========================================================
# ChainLink Co-op Datapack — Reiniciar Partida (reset)
# ==========================================================

# 1. Desactivar bucle de juego
scoreboard players set #active chainlink.state 0

# 2. Limpiar roles y equipos
function chainlink:roles/clear

# 3. Vaciar snapshots de almacenamiento NBT
data modify storage chainlink:sync bc_inv set value []
data modify storage chainlink:sync bc_equip set value {}
data modify storage chainlink:sync da_inv set value []
data modify storage chainlink:sync da_equip set value {}

# 4. Restablecer atributos y pantallas
attribute @a minecraft:max_health base set 20.0
title @a clear
title @a reset

tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"Partida reiniciada y vínculos desactivados.","color":"red"}]
