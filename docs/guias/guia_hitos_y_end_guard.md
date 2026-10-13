# Guía Técnica del Sistema Dinámico de Hitos y Guardián del End

## 1. Visión General
El módulo de Hitos y Bloqueo del End (`data/chainlink/function/milestones/`) provee la capa de progresión y condición de victoria para **ChainLink Co-op**. 

Para poder acceder a The End y enfrentar a la Dragona, los 4 jugadores conectados deben cooperar para completar un número configurable de **hitos aleatorios** (`#milestones_req`).

---

## 2. Guardián del End (`end_guard.mcfunction`)
Mientras el estado sea `#end_unlocked chainlink.state = 0`:
1. **Barrera Dimensional**:
   - Cualquier jugador que ingrese a `minecraft:the_end` es expulsado inmediatamente a `0 100 0` en el Overworld con efecto de `slow_falling` (10s), advertencia visual de pantalla completa (`¡ACCESO DENEGADO!`), efectos sonoros (`elder_guardian.curse`, `chest.locked`) y mensaje en el chat con botón clicable.
2. **Disolución de Portales en el Overworld**:
   - En un radio de 9x7x9 bloques alrededor de cualquier jugador en modo supervivencia/aventura, los bloques `minecraft:end_portal` son reemplazados inmediatamente por `minecraft:air`.
   - Se emite una alerta en la barra de acción (`actionbar`), partículas de portal inverso y sonido de extinción de fuego.
3. **Desbloqueo Automático**:
   - Cuando `#milestones_done >= #milestones_req`, se ejecuta `unlock_end.mcfunction`, desbloqueando el portal de forma permanente para la partida (`#end_unlocked = 1`), con sonido `ui.toast.challenge_complete` y títulos conmemorativos.
4. **Condición de Victoria**:
   - Se monitoriza el objetivo `chainlink.dragon` (`minecraft.killed:minecraft.ender_dragon`). Al abatir a la dragona, se ejecuta `victory.mcfunction` desplegando fuegos artificiales, celebración en el chat y reinicio del contador.

---

## 3. Banco de 80 Hitos (`init_pool.mcfunction`)
El pool pre-cargado almacena 80 objetivos balanceados en `storage chainlink:milestones pool`:
- **Categoría 1: Jefes y Mini-Jefes (IDs 1-16)**: Warden, Wither, Elder Guardian, Breeze, Evoker, Ravager, Piglin Brute, Ghast, Blazes, Wither Skeletons, Bogged, Phantom, Brujas, Capitán de Patrulla, Magma Cubes, Endermans.
- **Categoría 2: Exploración y Estructuras (IDs 17-32)**: Ancient City, Bastion Remnant, Nether Fortress, Trial Chambers, Ocean Monument, Woodland Mansion, Pirámide del Desierto, Templo de la Selva, Mineshaft, Pillager Outpost, Cabaña de Bruja, Naufragio, Trail Ruins, Fósil del Nether, Stronghold, 5 Biomas del Nether.
- **Categoría 3: Equipamiento y Crafteo Épico (IDs 33-48)**: Maza, Heavy Core, Armadura Full Netherita, Tridente, Conduit, Manzana Dorada Encantada, Tótem, Wind Charges, Crafter, Plantilla de Netherita, Brújula de Recuperación, Lodestone, Catalejo, Ballesta, Poción, Lingote de Netherita.
- **Categoría 4: Combate y Hazañas (IDs 49-64)**: Reflejo de bola de Ghast, Tiro a 50m con arco, Raid completada, Vault abierta, 20 Creepers muertos, Diana a 30m, Maza al caer, Breeze deflect, Ballesta multitiro, Bloqueo de 200 daño con escudo, Escudo Sculk, Montar Strider en lava, Bloque Froglight.
- **Categoría 5: Cooperación, Granja y Supervivencia (IDs 65-80)**: 2 jugadores en Camello, 4 jugadores a menos de 6m, Beacon tier 4, Ominous Bottle bebida, 20 crías de animales, Todos los lobos domesticados, Aldeano Maestro, Comer pastel, Disco musical, Tiesto desenterrado, Tocar campana 5 veces, Casco de tortuga, Miel bebida, Loro al hombro, Armor Trim aplicado, 64 trigos cosechados.

---

## 4. Algoritmo de Sorteo Aleatorio (`roll.mcfunction`)
1. Limpia los registros anteriores (`scoreboard players reset * chainlink.milestones`).
2. Copia `pool` a `temp_pool`.
3. Para cada hito requerido:
   - Genera un número pseudoaleatorio uniforme (`random value 0..999999`).
   - Aplica operación módulo (`% #pool_size`) para obtener un índice exacto.
   - Extrae el elemento de `temp_pool` eliminándolo para evitar repeticiones.
   - Lo agrega a `storage chainlink:milestones active` y activa su marcador `#m_<id>_active = 1`.
4. Sincroniza la Bossbar de progreso (`chainlink:progress`).

---

## 5. Menú Interactivo y Comandos
- `/function chainlink:milestones/menu`: Menú interactivo con botones clicables para:
  - Cambiar cuota de hitos (`[5]`, `[10]`, `[15]`, `[20]`, `[25]`, `[30]`).
  - Re-sortear hitos al instante (`[🎲 RE-SORTEAR HITOS]`).
  - Ver objetivos actuales (`[📜 VER HITOS ACTIVOS]`).
  - Consultar estado (`[📊 ESTADO]`).
  - Herramientas de admin (`[⏭ Forzar Hito]`, `[🔓 Desbloquear End]`, `[🔒 Bloquear End]`, `[🏆 Probar Victoria]`).
- `/function chainlink:milestones/list`: Lista detallada en chat con indicadores visuales:
  - `[✔] Nombre - Descripción [Categoría]` (en verde para completados).
  - `[✘] Nombre - Descripción [Categoría]` (en rojo/dorado para pendientes).
- `/function chainlink:milestones/status`: Resumen rápido de hitos completados y estado del End.

---

## 6. Cómo Agregar Nuevos Hitos Dinámicamente (`custom_add.mcfunction`)
Puedes registrar nuevos hitos sin reiniciar la partida llamando a la macro:
```mcfunction
data modify storage chainlink:milestones new_milestone set value {id:81,name:"Maestro del Cobre",desc:"Conseguir un bloque de cobre cincelado",category:"Equipamiento"}
function chainlink:milestones/custom_add with storage chainlink:milestones new_milestone
```
Luego añade su condición en `data/chainlink/function/milestones/check_active.mcfunction`:
```mcfunction
execute if score #m_81_active chainlink.milestones matches 1 if score #m_81_done chainlink.milestones matches 0 if entity @a[nbt={Inventory:[{id:"minecraft:chiseled_copper"}]}] run function chainlink:milestones/complete {id:81,name:"Maestro del Cobre",desc:"Conseguir un bloque de cobre cincelado",category:"Equipamiento"}
```
