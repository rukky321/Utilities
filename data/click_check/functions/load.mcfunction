#> click_check:load
#
# @private

#>
# From click_check  
# click_check管理用スコア  
# @within click_check:**
scoreboard objectives add click_check dummy

# タグを定義
#>
# From click_check  
# クリックを検知したいプレイヤに対してつけるタグ
# @public
#define tag CC.target
#> 
# From click_check  
# 左クリックしたプレイヤにつくタグ  
#@public
#define tag CC.left_clicked 
#> 
# From click_check  
# 右クリックしたプレイヤにつくタグ  
#@public
#define tag CC.right_clicked 