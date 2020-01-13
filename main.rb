require './character'
require './brave'
require './monster'

# 勇者クラスをインスタンス化
brave = Brave.new(name:"テリー", hp:500, offense:150, defense:100)
# モンスタークラスをインスタンス化
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# attackメソッドの呼び出し
brave.attack(monster)
monster.attack(brave)

# ループ処理
loop do
  brave.attack(monster)
  if monster.hp <= 0
    exp = (monster.offense + monster.defense) * 2
    gold = (monster.offense + monster.defense) * 3
    puts "#{brave.name}はたたかいに勝った"
    puts "#{exp}の経験値と#{gold}ゴールドを獲得した"
    break
  end

  monster.attack(brave)

  if brave.hp <= 0
    puts "#{brave.name}はたたかいに負けた"
    puts "目の前が真っ暗になった"
    break
  end
end