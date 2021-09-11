class ApplicationController < ActionController::Base
  #before_action :authenticate_user!今後必須の記述となる為一旦メモ記述で残してあります。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:first_name,:last_name,:first_name_kana,:last_name_kana,:birth_day])
  end
end
