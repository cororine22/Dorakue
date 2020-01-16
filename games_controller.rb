require './message_dialog'

class GamesController
    # MessageDialogのインクルード
    include MessageDialog
    
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
            result = calculate_of_exp_and_gold

            # end_messageを呼び出す
            end_message(result)
        end

        # 経験値とゴールドの計算
        def calculate_of_exp_and_gold
            if brave_win?
                brave_win_flag = true
                exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
                gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
            else
                brave_win_flag = false
                exp = 0
                gold = 0
            end

            {brave_win_flag: brave_win_flag, exp: exp, gold: gold}
        end
end