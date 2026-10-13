# Changelog — ChainLink Co-op Datapack

Todos los cambios notables de este proyecto se documentan de forma incremental y cronológica en este archivo.

## [v1.0.0] - 2026-10-12
### Añadido
- **Soporte Nativo Minecraft Java 26.2 y 26.3**: Configuración de `pack.mcmeta` con `min_format: [107, 0]` y `max_format: [121, 0]` y estructura de registros en singular (`function`, `tags/function`).
- **Sistema de Roles para 4 Jugadores (A, B, C, D)**:
  - Selección manual e interactiva mediante chat (`/function chainlink:menu`) y asignación aleatoria (`/function chainlink:roles/random`).
  - Equipo cooperativo unificado con prefijos de rol e indicadores visuales.
- **Vínculo de Vida Bidireccional (`A ↔ B` y `C ↔ D`)**:
  - Sincronización en tiempo real de salud entre parejas vinculadas.
  - Propagación instantánea de muerte cuando uno de los miembros del par de vida fallece.
- **Vínculo de Inventario 1:1 en Tiempo Real (`B ↔ C` y `D ↔ A`)**:
  - Detección instantánea de cambios en los 36 slots de inventario, armadura (`head`, `chest`, `legs`, `feet`) y mano secundaria (`offhand`) mediante instantáneas NBT en `storage chainlink:sync`.
  - Prevención de duplicación de ítems al morir: el inventario cae una sola vez y se limpia automáticamente el del compañero vinculado y su instantánea NBT.
- **Sistema Dinámico de 80 Hitos Aleatorios y Bloqueo del End**:
  - Pool expandible de 80 hitos variados (Jefes, Estructuras, Dimensiones, Equipamiento, Combate y Cooperación).
  - Sorteo aleatorio configurable por partida (`5`, `10`, `15`, `20`, `25` hitos) con barra de progreso (`bossbar`) en pantalla.
  - Bloqueo físico y dimensional del Portal del End hasta completar todos los hitos de la partida.
  - Detección de victoria al derrotar a la Dragona del End (`minecraft:ender_dragon`).
- **Implementación del Core Link System**:
  - Creado sistema integral de funciones en `chainlink:` para gestión de salud, inventario, roles y reacción en cadena.
  - Añadido menú interactivo con eventos de clic snake_case para 26.3.
  - Incorporada documentación de arquitectura (`docs/planes/plan_v1_core_link_system.md`) y guía operativa (`docs/guias/guia_core_link_system.md`).
- **Implementación Completa del Sistema de Hitos y Guardián del End (`data/chainlink/function/milestones/`)**:
  - Implementado `end_guard.mcfunction` con protección multidimensional: expulsión instantánea al Overworld con caída lenta y advertencia sensorial si intentan entrar al End sellado, y disolución de bloques `minecraft:end_portal` en un radio de 9x7x9 bloques alrededor de los jugadores en el Overworld.
  - Evento épico `unlock_end.mcfunction` activado automáticamente cuando `#milestones_done >= #milestones_req` (`#end_unlocked = 1`) con anuncio global y sonido `minecraft:ui.toast.challenge_complete`.
  - Celebración triunfal `victory.mcfunction` activada al matar al dragón (`minecraft.killed:minecraft.ender_dragon`) con fuegos artificiales NBT 26.x y mensajes de felicitación.
  - Registro de 80 hitos cooperativos únicos y balanceados en `init_pool.mcfunction` a través de 5 categorías (Jefes, Estructuras, Equipamiento, Combate, Cooperación).
  - Algoritmo de extracción aleatoria sin reemplazo (`roll.mcfunction`, `roll_step.mcfunction`) garantizando selección uniforme mediante macros y `% #pool_size`.
  - Chequeo de alta eficiencia cada 20 ticks (`check_active.mcfunction`) evaluando únicamente hitos activos y pendientes.
  - Menú interactivo en chat (`menu.mcfunction`), comandos de cuota rápida (`set_5` a `set_30`), listado de hitos con iconos de estado (`list.mcfunction`, `list_item.mcfunction`) y resumen (`status.mcfunction`).
  - Creación de 14 predicados de localización y equipamiento en `data/chainlink/predicate/`.
  - Soporte de extensión dinámica mediante `custom_add.mcfunction`.

## [v1.0.1] - 2026-10-12
### Corregido
- **Empaquetado ZIP POSIX (Fix `Unknown function chainlink:menu`)**: Se reemplazó `Compress-Archive` de PowerShell (que guardaba separadores de ruta con barra invertida `\` de Windows, ignorados por el cargador de recursos de Minecraft) por empaquetado POSIX con barras normales `/`.
- **Sintaxis estricta 26.3**: Se eliminó `gamerule keepInventory false` (dejando únicamente `gamerule minecraft:keep_inventory false`) en `load.mcfunction` y se unificaron todos los eventos `click_event` en `data/chainlink/function/milestones/`.
- **Esquema de Predicados MC 26.3 (`type` y `structures`)**: Se actualizaron los 14 archivos JSON en `data/chainlink/predicate/` reemplazando `"condition"` por `"type"` y `"structure"` por `"structures"` según el nuevo codec de predicados de Minecraft 26.3.
