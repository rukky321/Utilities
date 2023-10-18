#> util:storage/init
# 
# @within util:storage/load

# ストレージの要素数を初期化
scoreboard players set Util.Storage.length Util 0

# ストレージを初期化
data modify storage util storage set value []
