# ==========================================================
# ChainLink Co-op Datapack — Iniciar Partida y Vínculos (start)
# ==========================================================

# 1. Activar bucle de juego
scoreboard players set #active chainlink.state 1

# 2. Inicializar parámetros de salud y sincronización
scoreboard players set #pair_ab_hp chainlink.state 2000
scoreboard players set #pair_cd_hp chainlink.state 2000
scoreboard players set #pair_ab_inited chainlink.state 0
scoreboard players set #pair_cd_inited chainlink.state 0
scoreboard players set #bc_inited chainlink.state 0
scoreboard players set #da_inited chainlink.state 0

# 3. Limpiar estados de muerte previos
tag @a remove chainlink_dead
scoreboard players reset @a chainlink.deaths

# 4. Asegurar salud máxima vanilla
execute as @a run attribute @s minecraft:max_health base set 20.0

# 5. Anuncio sonoro y visual a todos los jugadores
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.0
title @a title {"text":"⛓ VÍNCULOS ACTIVADOS ⛓","color":"gold","bold":true}
title @a subtitle {"text":"A↔B (Vida) | B↔C (Inv) | C↔D (Vida) | D↔A (Inv)","color":"yellow"}
tellraw @a ""
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"¡Partida iniciada! Todos los vínculos de vida e inventario están activos.","color":"green","bold":true}]
tellraw @a ""
