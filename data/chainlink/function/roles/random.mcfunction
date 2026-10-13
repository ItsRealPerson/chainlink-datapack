# ==========================================================
# ChainLink Co-op Datapack — Sorteo Aleatorio de Roles
# ==========================================================

# 1. Limpiar asignaciones previas
function chainlink:roles/clear

# 2. Asignar etiqueta de candidatos a todos los jugadores online
tag @a add chainlink_pool

# 3. Asignar rol A
execute as @r[tag=chainlink_pool] run function chainlink:roles/assign_a
tag @a[tag=chainlink_A] remove chainlink_pool

# 4. Asignar rol B
execute as @r[tag=chainlink_pool] run function chainlink:roles/assign_b
tag @a[tag=chainlink_B] remove chainlink_pool

# 5. Asignar rol C
execute as @r[tag=chainlink_pool] run function chainlink:roles/assign_c
tag @a[tag=chainlink_C] remove chainlink_pool

# 6. Asignar rol D
execute as @r[tag=chainlink_pool] run function chainlink:roles/assign_d
tag @a[tag=chainlink_D] remove chainlink_pool

# 7. Limpieza final de la etiqueta temporal
tag @a remove chainlink_pool

tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"¡Sorteo aleatorio de roles completado exitosamente!","color":"green","bold":true}]
