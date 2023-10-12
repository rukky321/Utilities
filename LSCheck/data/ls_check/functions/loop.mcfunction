#> ls_check:loop
#
# @within ls_check:check



#テスト用
# execute at @s run particle ash ~ ~ ~ 0 0 0 0.0001 1 normal


# マーカーを向いている方向に0.1マスずつ移動させていき、マーカーの座標を中心とした１辺が0.1の立方体を当たり判定として、その範囲内にチェック対象のモブがいるかを調べ、見つかれば対象にLSC.detected3タグを付与
tp @s ^ ^ ^0.1
execute at @s positioned ~-0.95 ~-0.95 ~-0.95 as @e[dx=0,type=#ls_check:entities,tag=!LSC.target] run tag @s add LSC.detected1
execute at @s positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=LSC.detected1,dx=0] if block ~ ~ ~ #ls_check:no_collision run tag @s add LSC.detected2
execute as @e[tag=LSC.target,sort=nearest,limit=1] anchored eyes positioned ^ ^ ^ as @e[tag=LSC.detected2,sort=nearest,limit=1] run tag @s add LSC.detected3
tag @e[tag=LSC.detected1] remove LSC.detected1
tag @e[tag=LSC.detected2] remove LSC.detected2


# カウントを増加
scoreboard players add LSC.count ls_check 1

# ループ回数が残っており、モブが見つかっておらず、その地点のブロックは通り抜け可能な場合には再起呼び出しする。
execute at @s if score LSC.count ls_check < LSC.num_loop ls_check if block ~ ~ ~ #ls_check:no_collision unless entity @e[tag=LSC.detected3] run function ls_check:loop