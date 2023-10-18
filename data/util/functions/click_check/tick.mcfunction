#> util:click_check/tick
#
# @within util:tick

# クリック検知タグ削除
tag @a[tag=Util.CC.left_clicked] remove Util.CC.left_clicked
tag @a[tag=Util.CC.right_clicked] remove Util.CC.right_clicked

# クリック検知処理
execute as @a[tag=Util.CC.target] at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run function util:click_check/check

# 前のtickに召喚したinteractionを削除
kill @e[type=interaction,tag=Util.CC.interaction]

# Util.CC.targetタグがついたプレイヤの頭にインタラクションを召喚
execute as @a[tag=Util.CC.target] at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run summon interaction ~ ~ ~ {Tags:["Util.CC.interaction"]}

# テスト用
#execute if entity @e[tag=Util.CC.left_clicked] run say left
#execute if entity @e[tag=Util.CC.right_clicked] run say right