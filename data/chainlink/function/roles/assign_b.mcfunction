# ==========================================================
# ChainLink Co-op Datapack — Asignación de Rol B
# ==========================================================

# Limpiar asignaciones previas del rol B en otros jugadores
tag @a[tag=chainlink_B] remove chainlink_B

# Remover otros roles del jugador actual
tag @s remove chainlink_A
tag @s remove chainlink_C
tag @s remove chainlink_D

# Asignar rol B y equipo
tag @s add chainlink_B
team join chainlink_B @s

# Sonido de confirmación y feedback
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"selector":"@s","color":"white","bold":true},{"text":" ha asumido el rol de ","color":"yellow"},{"text":"Persona B","color":"gold","bold":true},{"text":" (Vida con A | Inventario con C)","color":"gray"}]
