class Monster < Character
  
    # HPの半分の値を計算する定数
    CALC_HALF_HP = 0.5
    # 攻撃力にかける1.5は定数で定義
    POWER_UP_RATE = 1.5
  
    def initialize(**params)
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
        @transform_flag = true
        # 変身メソッドを実行
        transform
      end

        damage = calculate_damage(brave)
  
        # ダメージ反映処理の呼び出し
        cause_damage(target: brave, damage: damage)

        # attack_messageの呼び出し
        attack_message
        # damage_messageの呼び出し
        damage_message(target: brave, damage: damage)
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
      end
  
      # 変身メソッドの定義
      def transform
        # 変身後の名前
        transform_name = "ドラゴン"
  
        transform_message(origin_name: @name,transform_name: transform_name)
  
        # モンスターの攻撃力を1.5倍にする
        # 代入演算子で計算
        @offense *=  POWER_UP_RATE
  
        # モンスターの名前を変更
        @name = transform_name
      end
  end