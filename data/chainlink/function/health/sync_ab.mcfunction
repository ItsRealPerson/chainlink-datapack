# ==========================================================
# ChainLink Co-op Datapack — Sincronización de Vida (A ↔ B)
# ==========================================================

# 1. Ambos jugadores deben existir y estar vivos
execute unless entity @a[tag=chainlink_A,gamemode=!spectator] run return 0
execute unless entity @a[tag=chainlink_B,gamemode=!spectator] run return 0

# 2. No procesar si alguno está marcado como muerto
execute if entity @a[tag=chainlink_A,tag=chainlink_dead] run return 0
execute if entity @a[tag=chainlink_B,tag=chainlink_dead] run return 0

# 3. Leer la salud actual de ambos jugadores en centi-HP (20.0 = 2000)
execute as @a[tag=chainlink_A,gamemode=!spectator,limit=1] store result score #a_hp chainlink.hp run data get entity @s Health 100
execute as @a[tag=chainlink_B,gamemode=!spectator,limit=1] store result score #b_hp chainlink.hp run data get entity @s Health 100

# 4. Inicializar salud del par si no está configurada
execute unless score #pair_ab_inited chainlink.state matches 1 run scoreboard players operation #pair_ab_hp chainlink.state = #a_hp chainlink.hp
execute unless score #pair_ab_inited chainlink.state matches 1 run scoreboard players operation #pair_ab_hp chainlink.state < #b_hp chainlink.hp
execute unless score #pair_ab_inited chainlink.state matches 1 run scoreboard players set #pair_ab_inited chainlink.state 1

# 5. Obtener mínimo y máximo de salud actual entre A y B
scoreboard players operation #min_hp_ab chainlink.state = #a_hp chainlink.hp
scoreboard players operation #min_hp_ab chainlink.state < #b_hp chainlink.hp

scoreboard players operation #max_hp_ab chainlink.state = #a_hp chainlink.hp
scoreboard players operation #max_hp_ab chainlink.state > #b_hp chainlink.hp

# 6. CASO DAÑO: Si alguno recibió daño (min < salud guardada)
execute if score #min_hp_ab chainlink.state < #pair_ab_hp chainlink.state run scoreboard players operation #pair_ab_hp chainlink.state = #min_hp_ab chainlink.state

# 7. CASO CURACIÓN: Si nadie recibió daño pero alguien se curó (max > salud guardada)
execute if score #min_hp_ab chainlink.state >= #pair_ab_hp chainlink.state if score #max_hp_ab chainlink.state > #pair_ab_hp chainlink.state run scoreboard players operation #pair_ab_hp chainlink.state = #max_hp_ab chainlink.state

# 8. Sincronizar A si difiere de la salud del par
execute store result storage chainlink:tmp target_hp_float float 0.01 run scoreboard players get #pair_ab_hp chainlink.state
execute unless score #a_hp chainlink.hp = #pair_ab_hp chainlink.state as @a[tag=chainlink_A,gamemode=!spectator,limit=1] run function chainlink:health/clamp_hp with storage chainlink:tmp

# 9. Sincronizar B si difiere de la salud del par
execute store result storage chainlink:tmp target_hp_float float 0.01 run scoreboard players get #pair_ab_hp chainlink.state
execute unless score #b_hp chainlink.hp = #pair_ab_hp chainlink.state as @a[tag=chainlink_B,gamemode=!spectator,limit=1] run function chainlink:health/clamp_hp with storage chainlink:tmp

# 10. Actualizar visualizador de salud para actionbar
scoreboard players operation #pair_ab_hp_display chainlink.state = #pair_ab_hp chainlink.state
scoreboard players operation #pair_ab_hp_display chainlink.state /= #100 chainlink.state
