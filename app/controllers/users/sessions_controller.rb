# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end


  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected
  # def new
  #   if user_signed_in_in?
  #     redirect_to root_path
  #   end
  # end

  # def create
  #   user = User.find_by(email: params[email])
  #   if user && user.authenticate(params[:password])
  #     session[:use_id] = user.id
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def destroy
  #   session.delete :user_id
  #   redirect_to login_path
  # end

  def omniauth
  User.find_or_create_by(
    uid: request.env['omniauth.auth'][:uid],
    provider: request.env['omniauth.auth'][:provider],
    email: request.env['omniauth.auth'][:info][:email]
  ) do |u|
      u.password = SecureRandom.hex(15)
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
