# ==========================================================
# ChainLink Co-op Datapack — Bucle Principal por Tick (tick)
# Compatibilidad: Minecraft Java Edition 26.2 y 26.3
# ==========================================================

# 1. Bucle de hitos y bloqueo del portal del End (Siempre activo)
function chainlink:milestones/tick

# 2. Solo ejecutar la sincronización de vínculos (vida/inventario) si la partida está activa
execute unless score #active chainlink.state matches 1 run return 0

# 3. Detección de muertes y propagación de reacciones en cadena
function chainlink:death/check

# 4. Sincronización de salud en tiempo real (A ↔ B y C ↔ D)
function chainlink:health/sync

# 5. Sincronización de inventario 1:1 en tiempo real (B ↔ C y D ↔ A)
function chainlink:inventory/sync

# 6. Actualización de indicadores visuales en la barra de acción (Actionbar)
function chainlink:ui/actionbar
