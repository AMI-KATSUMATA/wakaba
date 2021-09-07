# frozen_string_literal: true

class Creators::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_creator, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
    protected

  def reject_creator
    @creator = Creator.find_by(email: params[:creator][:email].downcase)
    if @creator
      if (@creator.valid_password?(params[:creator][:password]) && (@creator.active_for_authentication? == false))
        flash[:alert] = "退会済みです。"
        redirect_to new_creator_session_path
      end
    else
      flash[:error] = "項目を入力してください。"
    end
  end
end
