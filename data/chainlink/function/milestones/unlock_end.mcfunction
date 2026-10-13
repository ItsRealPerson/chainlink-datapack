# ========================================================
# ChainLink Milestones - End Unlock Event
# Triggered once all required milestones are achieved
# ========================================================

# Update state to unlocked
scoreboard players set #end_unlocked chainlink.state 1

# Epic titles
title @a times 10 80 20
title @a title {"text":"¡PORTAL DEL END DESBLOQUEADO!","color":"dark_purple","bold":true}
title @a subtitle {"text":"¡Hitos completados! El Nexo permite el paso a The End.","color":"gold"}

# Epic sounds
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.0
playsound minecraft:block.end_portal.spawn master @a ~ ~ ~ 1.0 0.9

# Chat announcement
tellraw @a ""
tellraw @a {"text":"====================================================","color":"dark_purple","bold":true}
tellraw @a {"text":"            ★ ¡EL END HA SIDO DESBLOQUEADO! ★","color":"gold","bold":true}
tellraw @a [{"text":"El equipo ha completado satisfactoriamente los ","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true},{"text":" hitos necesarios.","color":"gray"}]
tellraw @a {"text":"Los portales del End ahora permanecerán abiertos. ¡Vayan y derroten al Dragón!","color":"aqua"}
tellraw @a {"text":"====================================================","color":"dark_purple","bold":true}
tellraw @a ""
