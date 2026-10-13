# ==========================================================
# ChainLink Co-op Datapack — Verificación de Reaparición (Respawn)
# ==========================================================

# Restaurar estado vanilla y limpiar etiqueta dead de jugadores reaparecidos
execute as @a[tag=chainlink_dead,gamemode=!spectator] run attribute @s minecraft:max_health base set 20.0
tag @a[tag=chainlink_dead,gamemode=!spectator] remove chainlink_dead
scoreboard players reset @a[scores={chainlink.deaths=1..}] chainlink.deaths
