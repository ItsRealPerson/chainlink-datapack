# Guía Técnica: Sistema Nativo de Diálogos / Formularios en Minecraft 26.3

## 1. Visión General
En Minecraft Java Edition 26.2 y 26.3, Mojang introdujo el sistema de formularios nativos controlados por datapacks en el registro `dialog` (`data/<namespace>/dialog/<id>.json`), complementado con el comando de servidor `/dialog` y tags especiales en la interfaz de usuario.

ChainLink Co-op aprovecha este sistema para sustituir los clásicos menús de chat basados en `tellraw` por interfaces gráficas nativas (GUI) accesibles mediante:
- Diálogos automáticos por comando: `/dialog show <jugador> chainlink:main_menu`
- Menú de Pausa (Escape -> Opciones personalizadas / Custom Options): mediante `#minecraft:pause_screen_additions`
- Menú de Acciones Rápidas (tecla rápida `G`): mediante `#minecraft:quick_actions`

---

## 2. Diálogos Implementados

### 2.1 Menú Principal (`chainlink:main_menu`)
- **Archivo**: `data/chainlink/dialog/main_menu.json`
- **Tipo**: `minecraft:multi_action`
- **Objetivo**: Presentar la topología del cuarteto y asignar roles o iniciar la partida.
- **Acciones Disponibles**:
  1. `Rol A (Vida B / Inv D)`: Ejecuta `/function chainlink:roles/assign_a`.
  2. `Rol B (Vida A / Inv C)`: Ejecuta `/function chainlink:roles/assign_b`.
  3. `Rol C (Vida D / Inv B)`: Ejecuta `/function chainlink:roles/assign_c`.
  4. `Rol D (Vida C / Inv A)`: Ejecuta `/function chainlink:roles/assign_d`.
  5. `🎲 Sortear Roles al Azar`: Ejecuta `/function chainlink:roles/random`.
  6. `▶ INICIAR PARTIDA`: Ejecuta `/function chainlink:start`.
  7. `🏆 Menú de Hitos`: Acción `minecraft:show_dialog` -> `chainlink:milestones_menu` (transición fluida en cliente).
  8. `🔄 Reiniciar Partida`: Ejecuta `/function chainlink:reset`.
  9. `Cerrar`: Botón de salida con ancho 200.

### 2.2 Menú de Hitos (`chainlink:milestones_menu`)
- **Archivo**: `data/chainlink/dialog/milestones_menu.json`
- **Tipo**: `minecraft:multi_action`
- **Objetivo**: Gestionar la cuota de hitos que sella el Portal del End y consultar el estado del juego.
- **Acciones Disponibles**:
  1. `📜 Ver Hitos en Chat`: Ejecuta `/function chainlink:milestones/list`.
  2. `🎲 Re-Sortear Hitos`: Ejecuta `/function chainlink:milestones/roll`.
  3. `Cuota: 5 Hitos`: Ejecuta `/function chainlink:milestones/set_5`.
  4. `Cuota: 10 Hitos`: Ejecuta `/function chainlink:milestones/set_10`.
  5. `Cuota: 15 Hitos`: Ejecuta `/function chainlink:milestones/set_15`.
  6. `Cuota: 20 Hitos`: Ejecuta `/function chainlink:milestones/set_20`.
  7. `Cuota: 25 Hitos`: Ejecuta `/function chainlink:milestones/set_25`.
  8. `Cuota: 30 Hitos`: Ejecuta `/function chainlink:milestones/set_30`.
  9. `⏩ Forzar +1 Hito (Admin)`: Ejecuta `/function chainlink:milestones/force_skip`.
  10. `🔓 Desbloquear End (Admin)`: Ejecuta `/function chainlink:milestones/unlock_end`.
  11. `⬅ Volver al Menú Principal`: Acción `minecraft:show_dialog` -> `chainlink:main_menu`.
  12. `Cerrar`: Botón de salida con ancho 200.

---

## 3. Integración en el Menú de Pausa y Acciones Rápidas
El datapack inyecta `chainlink:main_menu` en los tags nativos de Minecraft:
- `data/minecraft/tags/dialog/pause_screen_additions.json`: Permite a cualquier jugador abrir la configuración de ChainLink desde la pantalla de Escape.
- `data/minecraft/tags/dialog/quick_actions.json`: Permite abrir el menú pulsando la tecla `G` de acciones rápidas.

---

## 4. Invocación desde mcfunctions
Para garantizar retrocompatibilidad y ejecución tanto desde la consola como desde jugadores:
```mcfunction
# Si lo ejecuta un jugador (@s):
execute as @s run dialog show @s chainlink:main_menu

# Si se ejecuta desde consola o sin contexto (@s nulo):
execute unless entity @s as @a run dialog show @s chainlink:main_menu
```
Los archivos `chainlink:menu` y `chainlink:milestones/menu` ejecutan esta lógica manteniendo además un mensaje tellraw compacto en chat como respaldo visual.
