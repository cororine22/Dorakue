class Brave
  # nameのセッター
  def name=(name)
    @name = name
  end

  # hpのセッター
  def hp=(hp)
    @hp = hp
  end

  # offenseのセッター
  def offense=(offense)
    @offense = offense
  end

  # defenseのセッター
  def defense=(defense)
    @defense = defense
  end
end

# 勇者クラスをインスタンス化
brave = Brave.new

# パラメータに値を設定 ヒアドキュメント
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT
