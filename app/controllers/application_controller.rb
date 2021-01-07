class ApplicationController < ActionController::Base
  # デバイズのコントローラーが実行された時のみストロングパラメーラー
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ストロングパラメーター（ユーザー登録）
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end
