#> ls_check:tick
#
# @private

# テスト用
#execute as @e[tag=!LSC.detected] run data modify entity @s Glowing set value 0
#execute as @e[tag=LSC.detected] run data modify entity @s Glowing set value 1
tag @e[tag=LSC.detected] remove LSC.detected