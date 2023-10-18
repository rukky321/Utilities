#> util:rng/generate
#	@input score Util.RNG.max Util 生成される乱数の最大値-1 4なら0から3の値になる
# @output score  Util.RNG.value Util
# @private

# インプット値が不正な値である場合の処理
execute unless score Util.RNG.max Util matches -2147483648..2147483647 run scoreboard players set Util.RNG.max Util 100
execute if score Util.RNG.max Util matches -2147483648..0 run scoreboard players set Util.RNG.max Util 1

# 乱数生成
summon area_effect_cloud ~ ~ ~ {Tags:["Util.rng"]}
execute store result score Util.RNG.value Util run data get entity @e[tag=Util.rng,limit=1] UUID[0]
execute if score Util.RNG.value Util matches ..-1 run scoreboard players operation Util.RNG.value Util *= Util.const.-1 Util
scoreboard players operation Util.RNG.value Util %= Util.RNG.max Util

# 生成に使用したAECをキル
kill @e[tag=Util.rng]

# インプット用スコアをリセット
scoreboard players reset Util.RNG.max Util
