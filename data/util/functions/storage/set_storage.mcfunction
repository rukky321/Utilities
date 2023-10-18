#> util:storage/set_storage
# 実行者の専用ストレージを作成し、util storage[0]に持ってくる
# @within 

#ストレージが作られていなければ作成
execute unless score @s Util.StorageID matches -2147483648..2147483647 run function util:storage/create_new_storage

#ストレージを一番前に持ってくる
execute store result storage util tmp.ID int 1 run scoreboard players get @s Util.StorageID
function util:storage/move_storage with storage util tmp
data remove storage util tmp