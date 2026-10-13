# ==========================================================
# ChainLink Co-op Datapack — Asignación de Rol C
# ==========================================================

# Limpiar asignaciones previas del rol C en otros jugadores
tag @a[tag=chainlink_C] remove chainlink_C

# Remover otros roles del jugador actual
tag @s remove chainlink_A
tag @s remove chainlink_B
tag @s remove chainlink_D

# Asignar rol C y equipo
tag @s add chainlink_C
team join chainlink_C @s

# Sonido de confirmación y feedback
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ha asumido el rol de ","color":"yellow"},{"text":"Persona C","color":"green","bold":true},{"text":" (Vida con D | Inventario con B)","color":"gray"}]
