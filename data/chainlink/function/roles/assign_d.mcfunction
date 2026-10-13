# ==========================================================
# ChainLink Co-op Datapack — Asignación de Rol D
# ==========================================================

# Limpiar asignaciones previas del rol D en otros jugadores
tag @a[tag=chainlink_D] remove chainlink_D

# Remover otros roles del jugador actual
tag @s remove chainlink_A
tag @s remove chainlink_B
tag @s remove chainlink_C

# Asignar rol D y equipo
tag @s add chainlink_D
team join chainlink_D @s

# Sonido de confirmación y feedback
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ha asumido el rol de ","color":"yellow"},{"text":"Persona D","color":"aqua","bold":true},{"text":" (Vida con C | Inventario con A)","color":"gray"}]
