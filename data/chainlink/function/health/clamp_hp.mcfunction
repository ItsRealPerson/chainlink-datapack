# ==========================================================
# ChainLink Co-op Datapack — Ajuste Exacto de Salud (Macro)
# Ejecutado como @s (el jugador objetivo)
# Argumentos esperados en storage chainlink:tmp:
#   target_hp_float: salud objetivo (float)
# ==========================================================

# 1. En caso de que se requiera curación hacia arriba
effect give @s minecraft:instant_health 1 0 true

# 2. Fijar atributo max_health al valor exacto (Minecraft clampa la salud actual inmediatamente)
$attribute @s minecraft:max_health base set $(target_hp_float)

# 3. Restaurar capacidad máxima vanilla a 20.0
attribute @s minecraft:max_health base set 20.0

# 4. Señal visual y sonora de impacto
damage @s 0.001 minecraft:generic
