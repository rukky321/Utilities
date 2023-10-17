#> ls_check:tick
#
# @private

# テスト用
#execute as @e[tag=!Util.LSC.detected] run data modify entity @s Glowing set value 0
#execute as @e[tag=Util.LSC.detected] run data modify entity @s Glowing set value 1
tag @e[tag=Util.LSC.detected] remove Util.LSC.detected