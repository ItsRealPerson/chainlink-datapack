# ========================================================
# ChainLink Milestones - Pool Initialization (80 Milestones)
# Populates storage chainlink:milestones pool with 80 unique cooperative goals
# ========================================================

# Reset pool array
data modify storage chainlink:milestones pool set value []

# --------------------------------------------------------
# CATEGORÍA 1: JEFES Y MINI-JEFES (IDs 1 - 16)
# --------------------------------------------------------
data modify storage chainlink:milestones pool append value {id:1,name:"Eco de las Profundidades",desc:"Derrotar a un Warden en la Deep Dark",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:2,name:"Tormento de Tres Cabezas",desc:"Invocar y destruir al Wither en equipo",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:3,name:"Terror Abisal",desc:"Vencer a un Elder Guardian en el Monumento",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:4,name:"Juicio de la Tormenta",desc:"Exterminar a un Breeze en las Trial Chambers",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:5,name:"Fin de la Magia Oscura",desc:"Acabar con un Evoker antes de sus colmillos",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:6,name:"Furia Desatada",desc:"Derribar a un Ravager en un asalto",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:7,name:"Fuerza Bruta del Nether",desc:"Eliminar a un Piglin Brute en un Bastión",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:8,name:"Lamento en Llamas",desc:"Destruir a un Ghast en el Nether",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:9,name:"Vigilantes del Fuego",desc:"Eliminar a 5 Blazes en una Fortaleza",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:10,name:"Huesos Marchitos",desc:"Abatir a 10 Wither Skeletons en una Fortaleza",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:11,name:"Peste del Pantano",desc:"Vencer a un Bogged en pantano o trial",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:12,name:"Caza Fantasmal",desc:"Cazar a un Phantom en pleno vuelo nocturno",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:13,name:"Aquelarre Interrumpido",desc:"Neutralizar a 3 Brujas",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:14,name:"Caída del Capitán",desc:"Derrotar al Capitán con estandarte siniestro",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:15,name:"Furia Magmática",desc:"Destruir a 5 Magma Cubes gigantes",category:"Jefes"}
data modify storage chainlink:milestones pool append value {id:16,name:"Centinelas del Vacío",desc:"Exterminar a 15 Endermans por sus perlas",category:"Jefes"}

# --------------------------------------------------------
# CATEGORÍA 2: EXPLORACIÓN Y ESTRUCTURAS (IDs 17 - 32)
# --------------------------------------------------------
data modify storage chainlink:milestones pool append value {id:17,name:"Silencio Sepulcral",desc:"Infiltrarse en una Ancient City profunda",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:18,name:"Bastión de Oro y Sangre",desc:"Entrar a un Bastion Remnant en el Nether",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:19,name:"Bastión del Averno",desc:"Pisar los puentes de una Nether Fortress",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:20,name:"Cámaras del Juicio",desc:"Descubrir una Trial Chamber subterránea",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:21,name:"Imperio Sumergido",desc:"Descubrir un Monumento Oceánico",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:22,name:"Mansión de las Sombras",desc:"Localizar e ingresar a una Mansión del Bosque",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:23,name:"Tumba del Faraón",desc:"Encontrar una Pirámide del Desierto",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:24,name:"Misterio Selvático",desc:"Descubrir un Templo de la Selva",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:25,name:"Veta Abandonada",desc:"Explorar los túneles de una Mineshaft",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:26,name:"Puesto de Asedio",desc:"Asaltar un Pillager Outpost",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:27,name:"Cabaña Cenagosa",desc:"Descubrir una Cabaña de Bruja en el pantano",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:28,name:"Pecio del Corsario",desc:"Explorar la bodega de un Naufragio",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:29,name:"Huellas del Pasado",desc:"Localizar las ruinas de Trail Ruins",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:30,name:"Osamenta Ígnea",desc:"Hallar un Fósil del Nether en un Valle de Almas",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:31,name:"Fortaleza del Ojo",desc:"Descubrir los corredores de una Stronghold",category:"Estructuras"}
data modify storage chainlink:milestones pool append value {id:32,name:"Turista del Inframundo",desc:"Visitar los 5 biomas característicos del Nether",category:"Estructuras"}

# --------------------------------------------------------
# CATEGORÍA 3: EQUIPAMIENTO Y CRAFTEO ÉPICO (IDs 33 - 48)
# --------------------------------------------------------
data modify storage chainlink:milestones pool append value {id:33,name:"Golpe Demoledor",desc:"Conseguir o forjar una Maza",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:34,name:"El Núcleo Pesado",desc:"Obtener un Heavy Core de una Vault",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:35,name:"Armadura de Netherita",desc:"Equipar full armadura de Netherita",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:36,name:"Furia de los Mares",desc:"Obtener un Tridente de un Ahogado",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:37,name:"Faro del Océano",desc:"Craftear un Canalizador (Conduit)",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:38,name:"Manzana de los Dioses",desc:"Poseer una Manzana Dorada Encantada",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:39,name:"Segunda Oportunidad",desc:"Portar un Tótem de la Inmortalidad",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:40,name:"Furia Eólica",desc:"Conseguir o fabricar Wind Charges",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:41,name:"Revolución Fabril",desc:"Craftear un Crafter automático",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:42,name:"Molde Primordial",desc:"Conseguir la Plantilla de Mejora de Netherita",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:43,name:"Guía de las Almas",desc:"Forjar una Brújula de Recuperación",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:44,name:"Faro Magnético",desc:"Craftear una Magnetita (Lodestone)",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:45,name:"Visión del Vigía",desc:"Fabricar un Catalejo (Spyglass)",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:46,name:"Disparo de Precisión",desc:"Craftear y portar una Ballesta",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:47,name:"Alquimia Suprema",desc:"Destilar una poción en el soporte",category:"Equipamiento"}
data modify storage chainlink:milestones pool append value {id:48,name:"Lingote Indestructible",desc:"Forjar un Lingote de Netherita",category:"Equipamiento"}

# --------------------------------------------------------
# CATEGORÍA 4: COMBATE Y HAZAÑAS (IDs 49 - 64)
# --------------------------------------------------------
data modify storage chainlink:milestones pool append value {id:49,name:"Devuelto al Remitente",desc:"Matar a un Ghast reflejando su bola",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:50,name:"Duelo de Francotiradores",desc:"Abatir a un esqueleto con arco a 50m",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:51,name:"Héroes de la Aldea",desc:"Triunfar en una Invasión (Raid)",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:52,name:"Veredicto Ominoso",desc:"Abrir una Vault en las Trial Chambers",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:53,name:"Sobrecarga Explosiva",desc:"Eliminar a 20 Creepers en equipo",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:54,name:"Diana Perfecta",desc:"Acertar al centro de una Diana a 30m",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:55,name:"Golpe Meteórico",desc:"Asestar un golpe brutal con la Maza al caer",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:56,name:"Ráfaga Invertida",desc:"Desviar el ataque de un Breeze hacia él",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:57,name:"¿Quién es el Saqueador?",desc:"Disparar a un Pillager con ballesta",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:58,name:"Dos Pájaros de un Tiro",desc:"Ensartar a dos Phantoms con una flecha",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:59,name:"Descarga Quíntuple",desc:"Matar 5 enemigos distintos con ballesta",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:60,name:"Bautismo de Sangre",desc:"Eliminar al primer monstruo hostil",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:61,name:"Baluarte Impenetrable",desc:"Bloquear 200 de daño con escudo",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:62,name:"Contagio Oscuro",desc:"Matar un mob cerca de un Catalizador Sculk",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:63,name:"Navegante de Magma",desc:"Montar un Strider en lava con hongo",category:"Combate"}
data modify storage chainlink:milestones pool append value {id:64,name:"Brillo Batracio",desc:"Obtener un bloque de Froglight",category:"Combate"}

# --------------------------------------------------------
# CATEGORÍA 5: COOPERACIÓN, GRANJA Y SUPERVIVENCIA (IDs 65 - 80)
# --------------------------------------------------------
data modify storage chainlink:milestones pool append value {id:65,name:"La Caravana del Desierto",desc:"Montar 2 jugadores sobre un Camello",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:66,name:"Reunión del Cuarteto",desc:"Juntar a los 4 jugadores a menos de 6m",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:67,name:"Faro de la Gloria",desc:"Activar un Faro de nivel 4 completo",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:68,name:"Trago de Mal Presagio",desc:"Consumir una Ominous Bottle",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:69,name:"Granja Próspera",desc:"Criar a 20 crías de animales",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:70,name:"La Manada Completa",desc:"Domesticar todas las variedades de lobo",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:71,name:"Socio Capitalista",desc:"Subir un Aldeano a Maestro (Nivel 5)",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:72,name:"Banquete Comunitario",desc:"Colocar y comer una rebanada de Pastel",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:73,name:"Concierto en el Refugio",desc:"Reproducir un disco en un Tocadiscos",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:74,name:"Reliquia Desenterrada",desc:"Cepillar grava o arena y sacar un tiesto",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:75,name:"Clamor de Alarma",desc:"Tocar la campana de aldea 5 veces",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:76,name:"Corona de Escudos",desc:"Equiparse un Casco de Caparazón de Tortuga",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:77,name:"Dulce Remedio",desc:"Beber una Botella de Miel",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:78,name:"Emplumado al Hombro",desc:"Llevar un Loro domesticado al hombro",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:79,name:"Armadura de Gala",desc:"Aplicar un Armor Trim a una armadura",category:"Cooperación"}
data modify storage chainlink:milestones pool append value {id:80,name:"Granero Colmado",desc:"Cosechar 64 cultivos de trigo maduro",category:"Cooperación"}

# Set pool metadata score
scoreboard players set #pool_loaded chainlink.state 1
scoreboard players set #pool_size chainlink.config 80
