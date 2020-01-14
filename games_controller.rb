class GamesController
    # 経験値の計算に使用する定数
    EXP_CONSTANT = 2
    # ゴールドの計算に使用する定数
    GOLD_CONSTANT = 3

    # バトルの処理
    def battle(**params)
        # build_charactersを呼び出し
        build_characters(params)

        loop do
        @brave.attack(@monster)
        break if buttle_end?
        @monster.attack(@brave)
        break if buttle_end?
        end

        battle_judgment
    end

    # 以下のメソッドはクラス外から呼び出す必要がないのでprivate以下に記述する
    private

        # キャラクターのインスタンスをインスタンス変数に格納
        def build_characters(**params)
            @brave = params[:brave]
            @monster = params[:monster]

        end

        # バトル終了の判定
        def buttle_end?
            # 勇者かモンスター、どちらかのHPが0になったらバトルが終了する
            @brave.hp <= 0 || @monster.hp <= 0
        end

        # 勇者の勝利判定
        def brave_win?
            @brave.hp > 0
        end

        def battle_judgment
            # 勇者の勝敗によってメッセージを変える
            if brave_win?
                result = calculate_of_exp_and_gold
                puts "#{@brave.name}は戦いに勝った"
                puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールドを獲得した"
            else
                puts "#{@brave.name}は戦いに負けた"
                puts "目の前が真っ暗になった"
            end
        end

        # 経験値とゴールドの計算
        def calculate_of_exp_and_gold
            exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
            gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
            result = {exp: exp, gold: gold}

            result
        end
end