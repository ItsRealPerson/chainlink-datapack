# ==========================================================
# ChainLink Co-op Datapack — Verificación de Muertes y Reacción en Cadena
# ==========================================================

# 1. Comprobar si Persona A murió
execute as @a[tag=chainlink_A,scores={chainlink.deaths=1..}] run function chainlink:death/handle_death_a

# 2. Comprobar si Persona B murió
execute as @a[tag=chainlink_B,scores={chainlink.deaths=1..}] run function chainlink:death/handle_death_b

# 3. Comprobar si Persona C murió
execute as @a[tag=chainlink_C,scores={chainlink.deaths=1..}] run function chainlink:death/handle_death_c

# 4. Comprobar si Persona D murió
execute as @a[tag=chainlink_D,scores={chainlink.deaths=1..}] run function chainlink:death/handle_death_d

# 5. Comprobar reaparición de jugadores fallecidos
function chainlink:death/respawn_check
