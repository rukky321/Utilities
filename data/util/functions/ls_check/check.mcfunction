#> util:ls_check/check
# 視線の先にいるエンティティを検知する。  
# Util.LSC.targetタグがついたエンティティを実行者として実行。  
# 視線の先にいる対象にUtil.LSC.detectedタグをつける。  
# @input score Util.LSC.num_loop Util ループ回数。<ループ回数>*0.5 = <検知する長さ>  
# @read score Util.LSC.init_num_loop Util 上記のループ回数を設定しなかった場合に初期化されるループ回数。
# @output score Util.LSC.detected Util  0:視線の先にエンティティが存在しなかった。 1:存在した。
# @output tag Util.LSC.detected 視線の先にいたエンティティにつくタグ。
# @public

#	識別用のタグがついたマーカーを召喚する
execute at @s anchored eyes positioned ^ ^ ^ run summon marker ~ ~ ~ {Tags:["Util.LSC.marker"]}

# マーカーの向きを実行者の向いてる方向に設定
execute at @s anchored eyes positioned ^ ^ ^ run data modify entity @e[tag=Util.LSC.marker,sort=nearest,limit=1] Rotation set from entity @s Rotation

# カウント用スコアを0に初期化
scoreboard players set Util.LSC.count Util 0

# ループ回数を設定
execute unless score Util.LSC.num_loop Util matches -2147483648..2147483647 run scoreboard players operation Util.LSC.num_loop Util = Util.LSC.init_num_loop Util

#	ループ関数を実行
execute at @s anchored eyes positioned ^ ^ ^ as @e[tag=Util.LSC.marker,sort=nearest,limit=1] if score Util.LSC.count Util < Util.LSC.num_loop Util anchored eyes positioned ^ ^ ^ run function util:ls_check/loop

# 対象が見つかれば、その対象にUtil.LSC.detectedタグを付与する。
execute as @e[tag=Util.LSC.detected3] run tag @s add Util.LSC.detected

# 返り値の設定
execute store success score Util.LSC.detected Util if entity @e[tag=LSC_detected3]

# タグを削除
execute as @e[tag=Util.LSC.detected3] run tag @s remove Util.LSC.detected3


#	マーカーをキル
execute at @s anchored eyes positioned ^ ^ ^ run kill @e[sort=nearest,limit=1,tag=Util.LSC.marker]

# スコアのリセット
scoreboard players reset Util.LSC.count Util
scoreboard players reset Util.LSC.num_loop Util
