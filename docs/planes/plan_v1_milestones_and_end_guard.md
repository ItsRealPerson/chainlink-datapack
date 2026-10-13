# Plan de Desarrollo v1: Sistema Dinámico de Hitos y Bloqueo del End

## Objetivo
Implementar en `data/chainlink/function/milestones/` el sistema completo de:
1. **End Guard**: Bloqueo y protección absoluta del End hasta cumplir los hitos requeridos (`#milestones_done >= #milestones_req`), prevención de activación y destrucción de bloques de portal activos, y detección de victoria al matar al Ender Dragon.
2. **Pool de Hitos Dinámico y Extensible (80 Hitos)**: Banco de 80 hitos cooperativos variados (Jefes, Estructuras, Equipamiento, Desafíos Co-op, Crafteo, etc.) almacenados en `storage chainlink:milestones pool`.
3. **Mecánica de Selección (Roll) y Configuración**: Selección aleatoria y sin repetición de `#milestones_req` hitos, configurable vía menú interactivo en chat (`/function chainlink:milestones/menu`).
4. **Verificación Automática (`check_active`) y Estado**: Detección pasiva cada 20 ticks (1s) sin sobrecargar el servidor, soporte de barra de progreso Bossbar (`chainlink:progress`), y listado interactivo (`/function chainlink:milestones/list`).

## Arquitectura de Archivos
- `data/chainlink/function/milestones/`
  - `init.mcfunction`: Inicialización de scoreboards, bossbar y defaults.
  - `tick.mcfunction`: Bucle periódico (End Guard, verificador de hitos cada segundo, victoria).
  - `end_guard.mcfunction`: Guardián de la dimensión The End y destructor de portales si el End está sellado.
  - `unlock_end.mcfunction`: Secuencia épica de desbloqueo del portal.
  - `victory.mcfunction`: Celebración y fuegos artificiales al derrotar al Dragón.
  - `init_pool.mcfunction`: Registro de los 80 hitos en `storage chainlink:milestones pool`.
  - `roll.mcfunction`: Selección aleatoria de `#milestones_req` hitos únicos.
  - `menu.mcfunction`: Menú interactivo en chat con comandos tellraw clicables.
  - `list.mcfunction`: Visualización de hitos activos con indicador `[✔]` o `[✘]`.
  - `status.mcfunction`: Resumen rápido de progreso y estado del End.
  - `check_active.mcfunction`: Orquestador central de chequeo cada 20 ticks.
  - `on_complete.mcfunction`: Anuncio de hito completado, sonido y actualización de bossbar.
  - `custom_add.mcfunction`: Template/ejemplo documentado para agregar hitos fácilmente.
  - `checks/`: Funciones individuales o modulares para verificación de hitos complejos.

## Fases de Ejecución
1. **Fase 1**: Creación del plan y estructura base de scoreboards y almacenamiento.
2. **Fase 2**: Implementación del Guardián del End (`end_guard.mcfunction`), `unlock_end` y `victory`.
3. **Fase 3**: Catálogo exhaustivo de los 80 hitos en `init_pool.mcfunction` y sistema de expansión.
4. **Fase 4**: Algoritmo de Roll aleatorio y configurable (`roll.mcfunction` y `menu.mcfunction`).
5. **Fase 5**: Lógica de verificación pasiva (`check_active.mcfunction` y detectores asociados).
6. **Fase 6**: UI de chat (`list.mcfunction`, `status.mcfunction`), integración de bossbar y documentación en `docs/CHANGELOG.md` y guías.
7. **Fase 7**: Git commit & push obligatorio.
