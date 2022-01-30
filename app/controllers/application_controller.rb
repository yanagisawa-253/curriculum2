class ApplicationController < ActionController::Base
    # ログインユーザーのみtop,about以外の画面を開ける設定
    before_action :authenticate_user!,except: [:top]
end
