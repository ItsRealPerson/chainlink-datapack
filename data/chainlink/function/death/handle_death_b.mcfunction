# ==========================================================
# ChainLink Co-op Datapack — Manejo de Muerte: Persona B
# ==========================================================

# 1. Marcar a B como procesado para muerte y resetear contador
tag @s add chainlink_dead
scoreboard players reset @s chainlink.deaths

# 2. Matar a Persona A (Vínculo de Vida con B)
tag @a[tag=chainlink_A] add chainlink_dead
kill @a[tag=chainlink_A]

# 3. Vaciar inventarios de los compañeros vinculados en inventario
# B está vinculado con C -> C pierde su inventario
clear @a[tag=chainlink_C]
# A está vinculado con D -> D pierde su inventario
clear @a[tag=chainlink_D]

# 4. Limpiar instantáneas NBT de ambos pares para evitar duplicación
data modify storage chainlink:sync bc_inv set value []
data modify storage chainlink:sync bc_equip set value {}
data modify storage chainlink:sync da_inv set value []
data modify storage chainlink:sync da_equip set value {}

# 5. Restablecer variables de salud para reaparición
scoreboard players set #pair_ab_hp chainlink.state 2000
scoreboard players set #pair_ab_inited chainlink.state 0
scoreboard players set #bc_inited chainlink.state 0
scoreboard players set #da_inited chainlink.state 0

# 6. Efectos globales y anuncio en pantalla
playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1.0 0.5
title @a title {"text":"☠ REACCIÓN EN CADENA ☠","color":"red","bold":true}
title @a subtitle {"text":"B ha muerto ➔ A muere por vida ➔ Inventarios perdidos","color":"gold"}
tellraw @a ""
tellraw @a [{"text":"[ChainLink] ","color":"dark_red","bold":true},{"text":"¡Persona B ha muerto! ","color":"red","bold":true},{"text":"➔ Persona A muere por vínculo de vida. ","color":"gold"},{"text":"¡Los inventarios de (B↔C) y (D↔A) se han perdido!","color":"yellow"}]
tellraw @a ""
