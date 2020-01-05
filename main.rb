class Brave

  # new演算子から渡された引数を受け取る
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  def name
    @name
  end

  def hp
    @hp
  end

  def offense
    @offense
  end

  def defense
    @defense
  end

  # # nameのセッター
  # def name=(name)
  #   @name = name
  # end

  # # hpのセッター
  # def hp=(hp)
  #   @hp = hp
  # end

  # # offenseのセッター
  # def offense=(offense)
  #   @offense = offense
  # end

  # # defenseのセッター
  # def defense=(defense)
  #   @defense = defense
  # end
end

# 勇者クラスをインスタンス化
brave = Brave.new(name:"テリー", hp:500, offense:150, defense:100)

# パラメータに値を設定 ヒアドキュメント
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT
