require './message_dialog'

# 親クラス
class Character
    # MessageDialogのインクルード
    include MessageDialog

    attr_reader :offense, :defense
    attr_accessor :hp, :name
  
    def initialize(**params)
      @name = params[:name]
      @hp = params[:hp]
      @offense = params[:offense]
      @defense = params[:defense]
    end
  end  