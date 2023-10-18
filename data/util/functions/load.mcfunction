#> util:load
#
# @private

#>
#@defined util:load
# Utilities管理用スコア 
# @public
scoreboard objectives add Util dummy

# 定数スコアを設定
scoreboard players set Util.const.-1 Util -1

function util:ls_check/load
function util:click_check/load
function util:storage/load

#> 
# 定数スコア
# @within util:**
 #define score_holder Util.const.-1