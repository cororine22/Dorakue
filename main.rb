require './character'
require './brave'
require './monster'
require './games_controller'

# GamesControllerクラスをインスタンス化
games_controller = GamesController.new
# 勇者クラスをインスタンス化
terry = Brave.new(name:"テリー", hp:500, offense:150, defense:100)
# モンスタークラスをインスタンス化
slime = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# GamesControllerクラスのbattleメソッドを使用
games_controller.battle(brave: terry, monster: slime)