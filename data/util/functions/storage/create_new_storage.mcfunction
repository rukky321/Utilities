#> util:storage/create_new_storage
# 実行者の専用ストレージを作成する。
# @within util:storage/set_storage

scoreboard players add Util.Storage.current Util 1
data modify storage util storage prepend value {data:{}}
execute store result storage util storage[0].ID int 1 run scoreboard players get Util.Storage.current Util
scoreboard players operation @s Util.StorageID = Util.Storage.current Util
