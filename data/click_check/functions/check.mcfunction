#> click_check:check
# CC.targetタグがついたプレイヤを対象として右クリックか左クリックを行なったかの判定を行う。
# @within click_check:tick

# プレイヤのUUID[0]を取得
execute store result score CC.player_UUID click_check run data get entity @s UUID[0]

# interactionに左クリックした人と右クリックした人の両方のUUID[0]を取得
execute as @e[tag=CC.interaction,sort=nearest,limit=1,distance=..5] if data entity @s attack.player store result score CC.leftclick_UUID click_check run data get entity @s attack.player[0]
execute as @e[tag=CC.interaction,sort=nearest,limit=1,distance=..5] if data entity @s interaction.player store result score CC.rightclick_UUID click_check run data get entity @s interaction.player[0]

# プレイヤのスコアと格納したスコアが一致していればプレイヤにクリック検知タグをつける。
execute if score CC.player_UUID click_check = CC.leftclick_UUID click_check run tag @s add CC.left_clicked
execute if score CC.player_UUID click_check = CC.rightclick_UUID click_check run tag @s add CC.right_clicked

# 各スコアをリセット
scoreboard players reset CC.player_UUID click_check
scoreboard players reset CC.leftclick_UUID click_check
scoreboard players reset CC.rightclick_UUID click_check