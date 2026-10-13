# ========================================================
# ChainLink Milestones - Grand Victory Celebration
# Triggered when the Ender Dragon is defeated
# ========================================================

# Reset dragon kill counter to prevent duplicate triggers
scoreboard players reset @a chainlink.dragon
scoreboard players set #run_won chainlink.state 1

# Victorious Titles
title @a times 15 120 30
title @a title {"text":"¡VICTORIA TOTAL!","color":"gold","bold":true}
title @a subtitle {"text":"¡Han completado la Racha ChainLink y derrotado al Ender Dragon!","color":"green"}

# Audio celebration
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.0
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.0

# Launch celebratory fireworks
execute as @a at @s run summon firework_rocket ~ ~2 ~ {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:true,has_trail:true,colors:[16766720,5635925,16711935]}]}}}}

# Victory Chat Broadcast
tellraw @a ""
tellraw @a {"text":"====================================================","color":"gold","bold":true}
tellraw @a {"text":"           ★★★ ¡MISIÓN CUMPLIDA: VICTORIA! ★★★","color":"yellow","bold":true}
tellraw @a {"text":"¡El Nexo ha resistido la prueba definitiva!","color":"white"}
tellraw @a [{"text":"Hitos completados durante la partida: ","color":"gray"},{"score":{"name":"#milestones_done","objective":"chainlink.state"},"color":"green","bold":true},{"text":" / ","color":"gray"},{"score":{"name":"#milestones_req","objective":"chainlink.config"},"color":"yellow","bold":true}]
tellraw @a {"text":"¡Felicitaciones al equipo por su coordinación y supervivencia!","color":"aqua"}
tellraw @a {"text":"====================================================","color":"gold","bold":true}
tellraw @a ""
