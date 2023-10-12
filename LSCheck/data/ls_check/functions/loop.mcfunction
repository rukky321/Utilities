#> ls_check:loop
#
# @within ls_check:check


# マーカーを向いている方向に0.5マスずつ移動させていき、マーカーの座標を中心とした１辺が0.2の立方体を当たり判定として、その範囲内にチェック対象のモブがいるかを調べ、見つかれば対象にLSC.detected2タグを付与
execute at @s run tp @s ^ ^ ^0.5
execute at @s positioned ~-0.9 ~-0.9 ~-0.9 as @e[dx=0,type=#ls_check:entities,tag=!LSC.target] run tag @s add LSC.detected1
execute at @s positioned ~-0.1 ~-0.1 ~-0.1 as @e[tag=LSC.detected1,dx=0,sort=nearest,limit=1] run tag @s add LSC.detected2
tag @e[tag=LSC.detected1] remove LSC.detected1

# モブが見つかったがブロックに埋まっている場合にはDR_dc_targetタグを削除する
execute if entity @e[tag=LSC.detected2] at @s unless block ~ ~ ~ #ls_check:no_collision

# カウントを増加
scoreboard players add LSC.count ls_check 1

# ループ回数が残っており、モブが見つかっておらず、その地点のブロックは通り抜け可能な場合には再起呼び出しする。
execute at @s if score LSC.count ls_check < LSC.num_loop ls_check if block ~ ~ ~ #ls_check:no_collision unless entity @e[tag=LSC.detected2] run function ls_check:loop