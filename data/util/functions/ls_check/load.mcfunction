#> util:ls_check/load
#
# @within util:load

# 初期化処理
execute unless score Util.LSC.init_num_loop Util matches -2147483648..2147483647 run function util:ls_check/init

# タグを定義
#>
#@defined util:ls_check/load
# 視線を調べたい対象につけるタグ  
# このタグがついた対象を実行者としてls_check:checkを実行することで視線の方向にいる対象を検知できる。
# @public
#define tag Util.LSC.target
#>
#@defined util:ls_check/load
# 視線の先にいたエンティティにつくタグ。  
# @public
#define tag Util.LSC.detected
#>
#@defined util:ls_check/load
# util:ls_check/checkの返り値が入るスコアホルダー。  
# 0: 視線の先にエンティティが存在しなかった。 1:存在した。  
# @public
#define score_holder Util.LSC.detected
#>
# @defined util:ls_check/load
# util:ls_check/checkのループ回数を設定するスコア。  
# <ループ回数>*0.1=<検知する長さ>の計算式が成り立つ。
# @public 
#define score_holder Util.LSC.num_loop
#>
# @defined util:ls_check/load
# util:ls_check/loadの実行時にループ回数を設定しなかった場合に初期化されるループ回数。  
# util:ls_check/loadを実行しても初期化されない。
# @public
#define score_holder Util.LSC.init_num_loop