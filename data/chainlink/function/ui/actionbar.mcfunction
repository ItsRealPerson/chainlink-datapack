# ==========================================================
# ChainLink Co-op Datapack — Visualizador en Actionbar
# ==========================================================

# Actionbar para Persona A
title @a[tag=chainlink_A,gamemode=!spectator] actionbar [{"text":"[A] ","color":"red","bold":true},{"text":"❤️ B: ","color":"gray"},{"score":{"name":"#pair_ab_hp_display","objective":"chainlink.state"},"color":"red","bold":true},{"text":" HP ","color":"red"},{"text":"| ","color":"dark_gray"},{"text":"🎒 Inv con: ","color":"gray"},{"text":"D","color":"aqua","bold":true}]

# Actionbar para Persona B
title @a[tag=chainlink_B,gamemode=!spectator] actionbar [{"text":"[B] ","color":"gold","bold":true},{"text":"❤️ A: ","color":"gray"},{"score":{"name":"#pair_ab_hp_display","objective":"chainlink.state"},"color":"gold","bold":true},{"text":" HP ","color":"gold"},{"text":"| ","color":"dark_gray"},{"text":"🎒 Inv con: ","color":"gray"},{"text":"C","color":"green","bold":true}]

# Actionbar para Persona C
title @a[tag=chainlink_C,gamemode=!spectator] actionbar [{"text":"[C] ","color":"green","bold":true},{"text":"❤️ D: ","color":"gray"},{"score":{"name":"#pair_cd_hp_display","objective":"chainlink.state"},"color":"green","bold":true},{"text":" HP ","color":"green"},{"text":"| ","color":"dark_gray"},{"text":"🎒 Inv con: ","color":"gray"},{"text":"B","color":"gold","bold":true}]

# Actionbar para Persona D
title @a[tag=chainlink_D,gamemode=!spectator] actionbar [{"text":"[D] ","color":"aqua","bold":true},{"text":"❤️ C: ","color":"gray"},{"score":{"name":"#pair_cd_hp_display","objective":"chainlink.state"},"color":"aqua","bold":true},{"text":" HP ","color":"aqua"},{"text":"| ","color":"dark_gray"},{"text":"🎒 Inv con: ","color":"gray"},{"text":"A","color":"red","bold":true}]
