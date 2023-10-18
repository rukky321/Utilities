#> util:ls_check/loop
#
# @within util:ls_check/loop
# @within util:ls_check/check



#テスト用
# execute at @s run particle ash ~ ~ ~ 0 0 0 0.0001 1 normal


# マーカーを向いている方向に0.1マスずつ移動させていき、マーカーの座標を中心とした1辺が0.1の立方体を当たり判定として、その範囲内にチェック対象のモブがいるかを調べ、見つかれば対象にUtil.LSC.detected3タグを付与
tp @s ^ ^ ^0.1
execute at @s positioned ~-0.95 ~-0.95 ~-0.95 as @e[dx=0,type=#util:entities,tag=!Util.LSC.target] run tag @s add Util.LSC.detected1
execute at @s positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=Util.LSC.detected1,dx=0] if block ~ ~ ~ #util:no_collision run tag @s add Util.LSC.detected2
execute as @e[tag=Util.LSC.target,sort=nearest,limit=1] anchored eyes positioned ^ ^ ^ as @e[tag=Util.LSC.detected2,sort=nearest,limit=1] run tag @s add Util.LSC.detected3
tag @e[tag=Util.LSC.detected1] remove Util.LSC.detected1
tag @e[tag=Util.LSC.detected2] remove Util.LSC.detected2

# カウントを増加
scoreboard players add Util.LSC.count Util 1

# ループ回数が残っており、モブが見つかっておらず、その地点のブロックは通り抜け可能な場合には再起呼び出しする。
execute at @s if score Util.LSC.count Util < Util.LSC.num_loop Util if block ~ ~ ~ #util:no_collision unless entity @e[tag=Util.LSC.detected3] run function util:ls_check/loop