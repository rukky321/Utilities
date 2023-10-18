#> util:click_check/check
# Util.CC.targetタグがついたプレイヤを対象として右クリックか左クリックを行なったかの判定を行う。
# @within util:click_check/tick

# プレイヤのUUID[0]を取得
execute store result score Util.CC.player_UUID Util run data get entity @s UUID[0]

# interactionに左クリックした人と右クリックした人の両方のUUID[0]を取得
execute as @e[tag=Util.CC.interaction,sort=nearest,limit=1,distance=..5] if data entity @s attack.player store result score Util.CC.leftclick_UUID Util run data get entity @s attack.player[0]
execute as @e[tag=Util.CC.interaction,sort=nearest,limit=1,distance=..5] if data entity @s interaction.player store result score Util.CC.rightclick_UUID Util run data get entity @s interaction.player[0]

# プレイヤのスコアと格納したスコアが一致していればプレイヤにクリック検知タグをつける。
execute if score Util.CC.player_UUID Util = Util.CC.leftclick_UUID Util run tag @s add Util.CC.left_clicked
execute if score Util.CC.player_UUID Util = Util.CC.rightclick_UUID Util run tag @s add Util.CC.right_clicked

# 各スコアをリセット
scoreboard players reset Util.CC.player_UUID Util
scoreboard players reset Util.CC.leftclick_UUID Util
scoreboard players reset Util.CC.rightclick_UUID Util