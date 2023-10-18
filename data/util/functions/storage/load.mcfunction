#> util:storage/load
# 
# @private

#> 
# ストレージ番号
# @within util:storage**
scoreboard objectives add Util.StorageID dummy

execute unless score Util.Storage.current Util matches -2147483648..2147483647 run function util:storage/init

#> 
# @defined util:storage/load
# 現在割り振られている最大のストレージID
# @within util:storage**
#define score_holder Util.Storage.current