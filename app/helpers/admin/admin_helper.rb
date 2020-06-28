module Admin::AdminHelper

 # 渡された管理者でログインする
  def log_in(admin)
    session[:admin_id] = admin.id
  end

 # 現在ログイン中の管理者を返す (いる場合)
  def current_admin
    if session[:admin_id]
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  # 現在の管理者をログアウトする
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  # ログインしているか確認
  def logged_in?
    !current_admin.nil?
  end

  # 渡された値で色を変える
  def foo_color(var)
    if var == true
      "#99CCFF"
    else
      "#FF6666"
    end
  end

end
