# ==========================================================
# ChainLink Co-op Datapack — Sincronización de Vida (C ↔ D)
# ==========================================================

# 1. Ambos jugadores deben existir y estar vivos
execute unless entity @a[tag=chainlink_C,gamemode=!spectator] run return 0
execute unless entity @a[tag=chainlink_D,gamemode=!spectator] run return 0

# 2. No procesar si alguno está marcado como muerto
execute if entity @a[tag=chainlink_C,tag=chainlink_dead] run return 0
execute if entity @a[tag=chainlink_D,tag=chainlink_dead] run return 0

# 3. Leer la salud actual de ambos jugadores en centi-HP (20.0 = 2000)
execute as @a[tag=chainlink_C,gamemode=!spectator,limit=1] store result score #c_hp chainlink.hp run data get entity @s Health 100
execute as @a[tag=chainlink_D,gamemode=!spectator,limit=1] store result score #d_hp chainlink.hp run data get entity @s Health 100

# 4. Inicializar salud del par si no está configurada
execute unless score #pair_cd_inited chainlink.state matches 1 run scoreboard players operation #pair_cd_hp chainlink.state = #c_hp chainlink.hp
execute unless score #pair_cd_inited chainlink.state matches 1 run scoreboard players operation #pair_cd_hp chainlink.state < #d_hp chainlink.hp
execute unless score #pair_cd_inited chainlink.state matches 1 run scoreboard players set #pair_cd_inited chainlink.state 1

# 5. Obtener mínimo y máximo de salud actual entre C y D
scoreboard players operation #min_hp_cd chainlink.state = #c_hp chainlink.hp
scoreboard players operation #min_hp_cd chainlink.state < #d_hp chainlink.hp

scoreboard players operation #max_hp_cd chainlink.state = #c_hp chainlink.hp
scoreboard players operation #max_hp_cd chainlink.state > #d_hp chainlink.hp

# 6. CASO DAÑO: Si alguno recibió daño (min < salud guardada)
execute if score #min_hp_cd chainlink.state < #pair_cd_hp chainlink.state run scoreboard players operation #pair_cd_hp chainlink.state = #min_hp_cd chainlink.state

# 7. CASO CURACIÓN: Si nadie recibió daño pero alguien se curó (max > salud guardada)
execute if score #min_hp_cd chainlink.state >= #pair_cd_hp chainlink.state if score #max_hp_cd chainlink.state > #pair_cd_hp chainlink.state run scoreboard players operation #pair_cd_hp chainlink.state = #max_hp_cd chainlink.state

# 8. Sincronizar C si difiere de la salud del par
execute store result storage chainlink:tmp target_hp_float float 0.01 run scoreboard players get #pair_cd_hp chainlink.state
execute if score #c_hp chainlink.hp != #pair_cd_hp chainlink.state run data modify storage chainlink:tmp target set value "@a[tag=chainlink_C,gamemode=!spectator]"
execute if score #c_hp chainlink.hp != #pair_cd_hp chainlink.state run function chainlink:health/clamp_hp with storage chainlink:tmp

# 9. Sincronizar D si difiere de la salud del par
execute store result storage chainlink:tmp target_hp_float float 0.01 run scoreboard players get #pair_cd_hp chainlink.state
execute if score #d_hp chainlink.hp != #pair_cd_hp chainlink.state run data modify storage chainlink:tmp target set value "@a[tag=chainlink_D,gamemode=!spectator]"
execute if score #d_hp chainlink.hp != #pair_cd_hp chainlink.state run function chainlink:health/clamp_hp with storage chainlink:tmp

# 10. Actualizar visualizador de salud para actionbar
scoreboard players operation #pair_cd_hp_display chainlink.state = #pair_cd_hp chainlink.state
scoreboard players operation #pair_cd_hp_display chainlink.state /= #100 chainlink.state
