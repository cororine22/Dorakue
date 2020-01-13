class GamesController
    # 経験値の計算に使用する定数
    EXP_CONSTANT = 2
    # ゴールドの計算に使用する定数
    GOLD_CONSTANT = 3

    # バトルの処理
    def battle(**params)
        brave = params[:brave]
        monster = params[:monster]

        loop do
        brave.attack(monster)
        break if buttle_end?(monster)
        monster.attack(brave)
        break if buttle_end?(brave)
        end
        # 勇者の勝敗によってメッセージを変える
        if battle_result(brave)
            result = calculate_of_exp_and_gold(monster)
            puts "#{brave.name}は戦いに勝った"
            puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
        else
            puts "#{brave.name}は戦いに負けた"
            puts "目の前が真っ暗になった"
        end
    end

    # 以下のメソッドはクラス外から呼び出す必要がないのでprivate以下に記述する
    private
        # バトル終了の判定
        def buttle_end?(character)
            character.hp <= 0
        end

        # 勇者の勝利判定
        def battle_result(brave)
            brave.hp > 0
        end

        # 経験値とゴールドの計算
        def calculate_of_exp_and_gold(monster)
            exp = (monster.offense + monster.defense) * EXP_CONSTANT
            gold = (monster.offense + monster.defense) * GOLD_CONSTANT
            result = {exp: exp, gold: gold}

            result
        end
end