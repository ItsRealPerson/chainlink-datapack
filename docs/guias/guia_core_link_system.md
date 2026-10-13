# Guía de Uso del Core Link System (ChainLink Co-op)

## Comandos Principales

### Menú de Selección y Configuración
- `/function chainlink:menu`: Abre el panel interactivo en el chat con botones para elegir rol (A, B, C, D), sortear roles al azar, iniciar o reiniciar la partida.
- `/function chainlink:start`: Inicia la sincronización activa de vida e inventario entre los 4 jugadores.
- `/function chainlink:reset`: Detiene la partida y limpia los roles, tags y storages de sincronización.

### Asignación de Roles Directa
- `/function chainlink:roles/assign_a`: Asigna el rol **Persona A** al jugador que lo ejecuta.
- `/function chainlink:roles/assign_b`: Asigna el rol **Persona B** al jugador que lo ejecuta.
- `/function chainlink:roles/assign_c`: Asigna el rol **Persona C** al jugador que lo ejecuta.
- `/function chainlink:roles/assign_d`: Asigna el rol **Persona D** al jugador que lo ejecuta.
- `/function chainlink:roles/random`: Asigna aleatoriamente los roles A, B, C y D a los jugadores conectados.

---

## Mecánicas en Juego

1. **Vínculo de Vida (A ↔ B y C ↔ D)**:
   - Toda la salud está unida. Si tu compañero sufre daño de cualquier tipo, tú recibirás el mismo daño en tiempo real.
   - Si uno de los dos muere, el otro caerá fulminado de forma instantánea.

2. **Vínculo de Inventario (B ↔ C y D ↔ A)**:
   - Comparten la mochila, barra rápida, armadura y mano izquierda.
   - Cualquier objeto recolectado, crafteado o gastado se reflejará de inmediato en el compañero.
   - Cada jugador mantiene libre su mano principal seleccionada para portar herramientas distintas.

3. **Muerte y Pérdida de Inventario**:
   - Al morir un par de vida, el inventario cae una sola vez en el lugar de la muerte.
   - El compañero de inventario superviviente ve su inventario vaciado (`clear`) para evitar duplicaciones ilegales y preservar la penalización de supervivencia.
