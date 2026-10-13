# Guía de Instalación, Uso y Expansión — ChainLink Co-op Datapack (MC 26.2 / 26.3)

## 1. Instalación en tu Mundo o Servidor
1. Copia la carpeta `chainlink-datapack` dentro de la carpeta `datapacks/` de tu mundo de Minecraft Java Edition **26.2** o **26.3** (`.minecraft/saves/<TuMundo>/datapacks/`).
2. Entra al mundo o servidor y ejecuta:
   ```mcfunction
   /reload
   ```
3. Verás en el chat el mensaje de confirmación de carga de **ChainLink Co-op**.

---

## 2. Cómo Configurar e Iniciar una Partida

### Paso 1: Abrir el Menú Principal
Ejecuta el comando:
```mcfunction
/function chainlink:menu
```
Desde este panel interactivo en el chat puedes hacer clic en los botones para:
- **Elegir tu Rol manualmente**: `[Persona A]`, `[Persona B]`, `[Persona C]`, `[Persona D]`.
- **Asignar Roles al Azar** entre los 4 jugadores conectados (`/function chainlink:roles/random`).
- **Configurar los Hitos** (`/function chainlink:milestones/menu`).
- **Iniciar la Partida** (`/function chainlink:start`).

### Paso 2: Entender los Vínculos del Equipo
Una vez asignados los 4 roles y activada la partida:
- **Persona A ↔ Persona B**: Comparten **VIDA** en tiempo real.
- **Persona B ↔ Persona C**: Comparten **INVENTARIO 1:1** en tiempo real.
- **Persona C ↔ Persona D**: Comparten **VIDA** en tiempo real.
- **Persona D ↔ Persona A**: Comparten **INVENTARIO 1:1** en tiempo real.

> **Ejemplo de Reacción en Cadena al Morir**:
> Si **Persona B** muere (por caída, lava o un mob):
> 1. **Persona A** muere inmediatamente porque está ligada en vida con **B**.
> 2. **Persona B** suelta su inventario al suelo (1 sola copia) y a **Persona C** se le borra el inventario (porque comparte inventario con **B**).
> 3. **Persona A** suelta su inventario al suelo (1 sola copia) y a **Persona D** se le borra el inventario (porque comparte inventario con **A**).
> ¡Un error mortal de una sola persona afecta a los 4 integrantes del equipo!

---

## 3. Sistema de Hitos y Desbloqueo del End

### Comandos Útiles de Hitos
- `/function chainlink:milestones/menu` — Abre el panel de configuración de hitos (cambiar cantidad requerida: 5, 10, 15, 20, 25, re-sortear hitos aleatorios, etc.).
- `/function chainlink:milestones/list` — Muestra en el chat la lista de hitos activos de tu partida actual y cuáles ya están completados (`[✔]` / `[✘]`).
- `/function chainlink:milestones/roll` — Genera una nueva selección aleatoria de hitos para la partida a partir del pool de 80 hitos.

### Cómo Agregar Más Hitos Personalizados (Sistema Expandible)
El datapack incluye **80 hitos pre-generados** en `data/chainlink/function/milestones/init_pool.mcfunction` y comprobados en `data/chainlink/function/milestones/check_active.mcfunction`.

Para añadir un nuevo hito (por ejemplo, el Hito #81):
1. Abre `data/chainlink/function/milestones/init_pool.mcfunction` y añade al final:
   ```mcfunction
   data modify storage chainlink:milestones pool append value {id:81,name:"Maestro del Cobre",desc:"Conseguir un bloque de cobre cincelado",category:"Items"}
   scoreboard players set #pool_size chainlink.config 81
   ```
2. Abre `data/chainlink/function/milestones/check_active.mcfunction` y añade la condición de detección en una sola línea:
   ```mcfunction
   execute if score #m_81 chainlink.milestones matches 1 if entity @a[tag=chainlink_player,nbt={Inventory:[{id:"minecraft:chiseled_copper"}]}] run function chainlink:milestones/complete {id:81,name:"Maestro del Cobre"}
   ```
3. Ejecuta `/reload` en el juego y el nuevo hito entrará automáticamente en los sorteos de partidas.
