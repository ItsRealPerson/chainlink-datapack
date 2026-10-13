# ==========================================================
# ChainLink Co-op Datapack — Limpiar Todos los Roles (clear)
# ==========================================================

tag @a remove chainlink_A
tag @a remove chainlink_B
tag @a remove chainlink_C
tag @a remove chainlink_D
tag @a remove chainlink_dead

team leave @a

tellraw @a [{"text":"[ChainLink] ","color":"gold","bold":true},{"text":"Todos los roles y equipos han sido restablecidos.","color":"yellow"}]
