#> click_check:tick
#
# @private

# クリック検知タグ削除
tag @a[tag=CC.left_clicked] remove CC.left_clicked
tag @a[tag=CC.right_clicked] remove CC.right_clicked

# クリック検知処理
execute as @a[tag=CC.target] at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run function click_check:check

# 前のtickに召喚したinteractionを削除
kill @e[type=interaction,tag=CC.interaction]

# CC.targetタグがついたプレイヤの頭にインタラクションを召喚
execute as @a[tag=CC.target] at @s anchored eyes positioned ^ ^ ^ positioned ~ ~-0.5 ~ run summon interaction ~ ~ ~ {Tags:["CC.interaction"]}

# テスト用
#execute if entity @e[tag=CC.left_clicked] run say left
#execute if entity @e[tag=CC.right_clicked] run say right