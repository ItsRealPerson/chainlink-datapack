# Plan de Implementación v2 — Sistema Nativo de Diálogos / Formularios en Minecraft 26.3

## 1. Contexto y Objetivos
Minecraft Java Edition 26.2 y 26.3 (`min_format: [107, 1]`, `max_format: [121, 0]`) incorporó el nuevo sistema nativo de formularios / pantallas de diálogo (`data/<namespace>/dialog/`) junto con el comando de servidor `/dialog show <targets> <dialog>` y `/dialog clear <targets>`.

El objetivo de esta fase es:
1. Crear el diálogo nativo del Menú Principal (`data/chainlink/dialog/main_menu.json`) con la topología 4P y selector de roles, sorteo al azar, inicio, reseteo y acceso al menú de hitos.
2. Crear el diálogo nativo del Menú de Hitos (`data/chainlink/dialog/milestones_menu.json`) para listar hitos, re-sortear, configurar cuota de 5 a 30 hitos y controles administrativos.
3. Actualizar `menu.mcfunction` y `milestones/menu.mcfunction` para disparar `/dialog show` de forma segura tanto para jugadores individuales (`@s`) como ejecución global (`@a`), manteniendo fallback de chat.
4. Integrar tags nativos (`data/minecraft/tags/dialog/pause_screen_additions.json` y `quick_actions.json`) para acceso instantáneo desde el menú de pausa y tecla de acceso rápido.
5. Validar la estructura JSON contra el bytecode oficial de `client-26.3.jar` (Mojang Codecs).

## 2. Especificación Técnica de los Diálogos (Minecraft 26.3)
- Tipo de Diálogo: `minecraft:multi_action` (`MultiActionDialog`)
- Campos Clave:
  - `type`: `"minecraft:multi_action"`
  - `title`: Componente de texto para el título superior
  - `external_title`: Componente de texto para botones en menús externos (`#minecraft:pause_screen_additions`)
  - `pause`: `false` (permite ver el mundo en tiempo real en partida cooperativa)
  - `can_close_with_escape`: `true`
  - `body`: `{"type": "minecraft:plain_message", "contents": ..., "width": 310}`
  - `columns`: `2` (distribución óptima en rejilla de 2 columnas)
  - `actions`: Lista de objetos `ActionButton`:
    - `label`: Componente de texto con formato
    - `tooltip`: Componente de texto emergente descriptivo
    - `action`:
      - `{"type": "minecraft:run_command", "command": "/function ..."}` para comandos
      - `{"type": "minecraft:show_dialog", "dialog": "chainlink:..."}` para navegación client-side sin latencia
  - `exit_action`: Botón inferior en footer (`"label": "Cerrar"`, `"width": 200`)

## 3. Fases de Ejecución
- **Fase 1**: Crear `data/chainlink/dialog/main_menu.json` y `data/chainlink/dialog/milestones_menu.json`.
- **Fase 2**: Crear los tags en `data/minecraft/tags/dialog/pause_screen_additions.json` y `quick_actions.json`.
- **Fase 3**: Actualizar `data/chainlink/function/menu.mcfunction` y `data/chainlink/function/milestones/menu.mcfunction`.
- **Fase 4**: Crear la guía técnica `docs/guias/guia_dialogos_nativos_26_3.md`.
- **Fase 5**: Registrar en `docs/CHANGELOG.md`.
- **Fase 6**: Commit y push a GitHub (`origin/master`).
