class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    case resource
    when Creator
      root_path
    when Musician
      recruit_user_path
    end
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :phone_number])
  end
end
