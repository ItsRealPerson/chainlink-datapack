# Plan Técnico Detallado: Core Link System (MC 26.2 y 26.3)

## 1. Alcance del Módulo
Este plan detalla la arquitectura e implementación del sistema base de enlaces cooperativos (**Core Link System**) para el Datapack `chainlink-datapack` en Minecraft Java Edition 26.2 y 26.3 (`min_format: [107, 1]`, `max_format: [121, 0]`).

## 2. Topología de los 4 Jugadores
Los jugadores se organizan en un ciclo de 4 nodos con 2 enlaces de vida y 2 enlaces de inventario:

```
    [Persona A] <==== (Vida) ====> [Persona B]
         ||                             ||
    (Inventario)                   (Inventario)
         ||                             ||
    [Persona D] <==== (Vida) ====> [Persona C]
```

- **A ↔ B**: Enlace bidireccional de salud (misma vida y muerte compartida).
- **B ↔ C**: Enlace bidireccional de inventario (sincronización exacta 1:1 de 41 slots).
- **C ↔ D**: Enlace bidireccional de salud (misma vida y muerte compartida).
- **D ↔ A**: Enlace bidireccional de inventario (sincronización exacta 1:1 de 41 slots).

## 3. Especificación de Componentes

### 3.1 Inicialización y Carga (`chainlink:load`)
- Creación de scoreboards:
  - `chainlink.state` (dummy para estados, flags y cálculos).
  - `chainlink.hp` (dummy para salud centesimal 0..2000).
  - `chainlink.deaths` (`deathCount` para detección fiable de muertes).
- Configuración de Equipos:
  - `chainlink_A` (Rojo, prefijo `[A] `)
  - `chainlink_B` (Oro, prefijo `[B] `)
  - `chainlink_C` (Verde, prefijo `[C] `)
  - `chainlink_D` (Aqua, prefijo `[D] `)
  - Desactivación de `friendlyFire` para evitar daño accidental entre compañeros.
- Reglas de juego (`gamerules`):
  - `keep_inventory false` (las muertes deben penalizar con pérdida de ítems).
- Inicialización de storages NBT en `storage chainlink:sync` y `storage chainlink:tmp`.

### 3.2 Bucle Principal (`chainlink:tick`)
- Ejecución condicional: solo activo si `#active chainlink.state` está encendido.
- Detección de muertes y ejecución de la reacción en cadena.
- Sincronización de vida (A ↔ B y C ↔ D).
- Sincronización de inventario (B ↔ C y D ↔ A).
- Interfaz en tiempo real en actionbar para todos los jugadores vivos.

### 3.3 Sincronización de Salud
- Cálculo en centi-HP (20.0 HP = 2000 puntos).
- Si un miembro del par recibe daño:
  - Se calcula el daño delta.
  - Se aplica al compañero mediante macro `/damage` de tipo `minecraft:generic` (para respetar mitigación previa de armadura) y ajuste de atributo `minecraft:max_health` para evitar desincronizaciones por invulnerabilidad (`HurtTime`).
- Si un miembro se cura:
  - Se aplica regeneración/efecto instantáneo controlado.

### 3.4 Sincronización de Inventario 1:1
- Espejo completo de:
  - `hotbar.0` a `hotbar.8` (9 slots)
  - `inventory.0` a `inventory.26` (27 slots)
  - `armor.head`, `armor.chest`, `armor.legs`, `armor.feet` (4 slots)
  - `weapon.offhand` (1 slot)
- Detección de cambios mediante comparación NBT instantánea con `storage chainlink:sync`.
- Copia limpia: slot destination vaciado previamente con `minecraft:air` y reemplazado con `execute if items entity @s <slot> * run item replace entity <target> <slot> from entity @s <slot>`.

### 3.5 Reacción en Cadena ante la Muerte
- Cuando A o B muere:
  - Su compañero de vida muere inmediatamente (`kill`).
  - C y D sufren el borrado de su inventario (`clear`) para evitar duplicaciones.
  - Las instantáneas NBT de inventario se resetean a vacío.
  - Notificación épica con sonido y título a todos los jugadores.
- Cuando C o D muere:
  - Su compañero de vida muere inmediatamente (`kill`).
  - B y A sufren el borrado de su inventario (`clear`).
  - Las instantáneas NBT de inventario se resetean a vacío.
