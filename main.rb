class Brave
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  # 必殺攻撃の計算に使う定数
  SPECIAL_ATTACK_CONSTANT = 1.5

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
    puts "#{@name}の攻撃"

    # decision_attack_typeメソッドの呼び出し
    attack_type = decision_attack_type

    # calculate_damageメソッドの呼び出し
    damage = calculate_damage(monster,attack_type)

    # ダメージをHPに反映させる
    cause_damage(monster, damage)

    # メッセージを追記
    puts "#{monster.name}の残りHPは#{monster.hp}だ"
  end

  # 攻撃の種類（通常攻撃 or 必殺攻撃）を判定するメソッド
  def decision_attack_type
    # 0~3の間でランダムに数字が変わる
    attack_num = rand(4)

    # 4分の1の確率でspecial_attackを実行
    if attack_num == 0
      puts "必殺攻撃"
      "special_attack"
    else
      puts "通常攻撃"
      "normal_attack"
    end
  end

  # ダメージの計算メソッド
  def calculate_damage(monster, attack_type)
    if attack_type == "special_attack"
      damage = calculate_special_attack - monster.defense
    else
      damage = @offense - monster.defense
    end
  end

  # HPにダメージを反映させる
  def cause_damage(monster, damage)
    monster.hp -= damage
    puts "#{monster.name}は#{damage}のダメージを受けた"
  end

  def calculate_special_attack
    # 攻撃力が1.5倍
    @offense * SPECIAL_ATTACK_CONSTANT
  end
end

class Monster
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  # セッターゲッターを一括定義
  attr_accessor :hp

  # HPの半分の値を計算する定数
  CALC_HALF_HP = 0.5
  # 攻撃力にかける1.5は定数で定義
  POWER_UP_RATE = 1.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    # モンスターが変身したかどうかを判定するフラグ
    @transform_flag = false

    # 変身する際の閾値（トリガー）を計算
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

  def attack(brave)
    # HPが半分以下、かつ、モンスター変身判定フラグがfalseの時に実行
    if @hp <= @trigger_of_transform && @transform_flag == false
      # モンスター変身判定フラグにtrueを代入
      transform_flag = true
      # 変身メソッドを実行
      transform
    end

    puts "#{@name}の攻撃"
    damage = @offense - brave.defense

    # ダメージ計算の処理を追加
    brave.hp -= damage

    # メッセージを追記
    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
  end

  # クラス外から呼び出せないようにする
  private
    # 変身メソッドの定義
    def transform
      # 変身後の名前
      transform_name = "ドラゴン"

      # 変身メッセージ(ヒアドキュメント)
      puts <<~EOS
      #{@name}は怒っている
      #{@name}は#{transform_name}に変身した
      EOS

      # モンスターの攻撃力を1.5倍にする
      # 代入演算子で計算
      @offense *=  POWER_UP_RATE

      # モンスターの名前を変更
      @name = transform_name

    end

end

# 勇者クラスをインスタンス化
brave = Brave.new(name:"テリー", hp:500, offense:300, defense:100)
# モンスタークラスをインスタンス化
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# attackメソッドの呼び出し
brave.attack(monster)
monster.attack(brave)

