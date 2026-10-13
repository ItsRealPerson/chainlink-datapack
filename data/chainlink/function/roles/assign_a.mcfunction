# ==========================================================
# ChainLink Co-op Datapack — Asignación de Rol A
# ==========================================================

# Limpiar asignaciones previas del rol A en otros jugadores
tag @a[tag=chainlink_A] remove chainlink_A

# Remover otros roles del jugador actual
tag @s remove chainlink_B
tag @s remove chainlink_C
tag @s remove chainlink_D

# Asignar rol A y equipo
tag @s add chainlink_A
team join chainlink_A @s

# Sonido de confirmación y feedback
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ha asumido el rol de ","color":"yellow"},{"text":"Persona A","color":"red","bold":true},{"text":" (Vida con B | Inventario con D)","color":"gray"}]
