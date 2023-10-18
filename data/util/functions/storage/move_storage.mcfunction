#> util:storage/move_storage
# 
# @within util:storage/set_storage

$data modify storage util tmp.data set from storage util storage[{ID:$(ID)}]
$data remove storage util storage[{ID:$(ID)}]
data modify storage util storage prepend from storage util tmp.data