class Brave < Character
    # 必殺攻撃の計算に使う定数
    SPECIAL_ATTACK_CONSTANT = 1.5

    # 攻撃処理を実装するメソッド
    def attack(monster)
  
        # decision_attack_typeメソッドの呼び出し
        attack_type = decision_attack_type
  
        # calculate_damageメソッドの呼び出し
        damage = calculate_damage(target: monster, attack_type: attack_type)
  
        # ダメージをHPに反映させる
        cause_damage(target: monster, damage: damage)

        # attack_messageの呼び出し
        attack_message(attack_type: attack_type)
        # damage_messageの呼び出し
        damage_message(target: monster, damage: damage)
      
    end
  
    private
  
      # 攻撃の種類（通常攻撃 or 必殺攻撃）を判定するメソッド
      def decision_attack_type
        # 0~3の間でランダムに数字が変わる
        attack_num = rand(4)
  
        # 4分の1の確率でspecial_attackを実行
        if attack_num == 0
        #   puts "必殺攻撃"
          "special_attack"
        else
        #   puts "通常攻撃"
          "normal_attack"
        end
      end
  
      # ダメージの計算メソッド
      def calculate_damage(**params)
        target = params[:target]
        attack_type = params[:attack_type]
  
        if attack_type == "special_attack"
          damage = calculate_special_attack - target.defense
        else
          damage = @offense - target.defense
        end
      end
  
      # HPにダメージを反映させる
      def cause_damage(**params)
        target = params[:target]
        damage = params[:damage]
  
        target.hp -= damage
  
        # もしターゲットのHPがマイナスになるなら0を代入
        target.hp = 0 if target.hp < 0
      end
  
      def calculate_special_attack
        # 攻撃力が1.5倍
        @offense * SPECIAL_ATTACK_CONSTANT
      end
  end