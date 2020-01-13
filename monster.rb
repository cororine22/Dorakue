class Monster < Character
    # 以下を削除
    # attr_reader :offense, :defense
    # attr_accessor :hp, :name
  
    # HPの半分の値を計算する定数
    CALC_HALF_HP = 0.5
    # 攻撃力にかける1.5は定数で定義
    POWER_UP_RATE = 1.5
  
    def initialize(**params)
      # 以下を削除
      # @name = params[:name]
      # @hp = params[:hp]
      # @offense = params[:offense]
      # @defense = params[:defense]
      super(
        name: params[:name],
        hp: params[:hp],
        offense: params[:offense],
        defense: params[:defense]
      )
  
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
      damage = calculate_damage(brave)
  
      # ダメージ反映処理の呼び出し
      cause_damage(target: brave, damage: damage)
  
      # メッセージを追記
      puts "#{brave.name}の残りHPは#{brave.hp}だ"
    end
  
    # クラス外から呼び出せないようにする
    private
  
      # ダメージ計算処理
      def calculate_damage(target)
        @offense - target.defense
      end
  
      # ダメージ反映処理
      def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
  
        target.hp -= damage
  
        # もしターゲットのHPがマイナスになるなら0を代入
        target.hp = 0 if target.hp < 0
  
        puts "#{target.name}は#{damage}のダメージを受けた"
      end
  
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