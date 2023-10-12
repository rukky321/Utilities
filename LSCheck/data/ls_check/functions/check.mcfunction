#> ls_check:check
# 視線の先にいるエンティティを検知する。  
# LSC.targetタグがついたエンティティを実行者として実行。  
# 視線の先にいる対象にLSC.detectedタグをつける。  
# @input score LSC.num_loop ls_check ループ回数。<ループ回数>*0.5 = <検知する長さ>  
# @read score LSC.init_num_loop ls_check 上記のループ回数を設定しなかった場合に初期化されるループ回数。
# @output score LSC.detected ls_check  0:視線の先にエンティティが存在しなかった。 1:存在した。
# @output tag LSC.detected 視線の先にいたエンティティにつくタグ。
# @public

#	識別用のタグがついたマーカーを召喚する
execute anchored eyes positioned ^ ^ ^ run summon marker ~ ~ ~ {Tags:["LSC.marker"]}

# マーカーの向きを実行者の向いてる方向に設定
execute anchored eyes positioned ^ ^ ^ run data modify entity @e[sort=nearest,limit=1,tag=LSC.marker] Rotation set from entity @s Rotation

# カウント用スコアを0に初期化
scoreboard players set LSC.count ls_check 0

# ループ回数を設定
execute unless score LSC.num_loop ls_check matches -2147483648..2147483647 run scoreboard players operation LSC.num_loop ls_check = LSC.init_num_loop ls_check

#	ループ関数を実行
execute anchored eyes positioned ^ ^ ^ as @e[sort=nearest,limit=1,tag=LSC.marker] if score LSC.count ls_check < LSC.num_loop ls_check run function ls_check:loop

# 対象が見つかれば、その対象にLSC.detectedタグを付与する。
execute as @e[tag=LSC_detected2] run tag @s add LSC.detected

# 返り値の設定
execute store success score LSC.detected ls_check if entity @e[tag=LSC_detected2]

# タグを削除
execute as @e[tag=LSC_detected2] run tag @s remove LSC.detected2

#	マーカーをキル
execute anchored eyes positioned ^ ^ ^ run kill @e[sort=nearest,limit=1,tag=LSC.marker]

# スコアのリセット
scoreboard players reset LSC.count ls_check
scoreboard players reset LSC.num_loop ls_check
