# frozen_string_literal: true

class Musicians::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_musician, only: [:create]


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

  def reject_musician
    @musician = Musician.find_by(email: params[:musician][:email].downcase)
    if @musician
      if (@musician.valid_password?(params[:musician][:password]) && (@musician.active_for_authentication? == false))
        flash[:alert] = "退会済みです。"
        redirect_to new_musician_session_path
      end
    else
      flash[:alert] = "項目を入力してください。"
    end
  end
end
