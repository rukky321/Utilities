#> ls_check:load
#
# @private

#>
# ls_check管理用スコア
# @public
scoreboard objectives add ls_check dummy

# 初期化処理
execute unless score LSC.init_num_loop ls_check matches -2147483648..2147483647 run function ls_check:init

# タグを定義
#>
# From ls_check  
# 視線を調べたい対象につけるタグ  
# このタグがついた対象を実行者としてls_check:checkを実行することで視線の方向にいる対象を検知できる。
# @public
#define tag LSC.target
#> 
# From ls_check  
# 視線の先にいたエンティティにつくタグ。  
# @public
#define tag LSC.detected
#>
# From ls_check  
# ls_check:checkの返り値が入るスコアホルダー。  
# 0: 視線の先にエンティティが存在しなかった。 1:存在した。  
# @public
#define score_holder LSC.detected
#>
# From ls_check  
# ls_check:checkのループ回数を設定するスコア。  
# <ループ回数>*0.5=<検知する長さ>の計算式が成り立つ。
# @public 
#define score_holder LSC.num_loop
#>
# From ls_check  
# ls_check:checkの実行時にループ回数を設定しなかった場合に初期化されるループ回数。  
# ls_check:checkを実行しても初期化されない。
# @public
#define score_holder LSC.init_num_loop