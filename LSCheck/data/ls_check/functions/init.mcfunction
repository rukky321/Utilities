#> ls_check:init
#
# @within ls_check:load

#>
# ls_check管理用スコア
# @public
scoreboard objectives add ls_check dummy

# 初期値設定
scoreboard players set LSC.init_num_loop ls_check 100