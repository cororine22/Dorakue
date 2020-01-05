class Brave
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  # new演算子から渡された引数を受け取る
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # 攻撃処理を実装するメソッド
  def attack(monster)
    # ダメージ計算の処理を追加
    damage = @offense - monster.defense
    monster.hp = monster.hp - damage

    # メッセージを追記
    puts "#{@name}の攻撃"
    puts "#{monster.name}は#{damage}のダメージを受けた"
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end
end

class Monster
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# 勇者クラスをインスタンス化
brave = Brave.new(name:"テリー", hp:500, offense:150, defense:100)
# モンスタークラスをインスタンス化
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# # パラメータに値を設定 ヒアドキュメント
# puts <<~TEXT
# NAME:#{brave.name}
# HP:#{brave.hp}
# OFFENSE:#{brave.offense}
# DEFENSE:#{brave.defense}
# TEXT

# # hpにダメージを与える処理
# brave.hp -= 30

# # ダメージに関するメッセージ
# puts "#{brave.name}はダメージを受けた!　残りHPは#{brave.hp}だ"

# attackメソッドの呼び出し
brave.attack(monster)

