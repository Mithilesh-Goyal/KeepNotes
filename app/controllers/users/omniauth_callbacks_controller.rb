# frozen_string_literal: true


class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    user = User.from_omniauth(auth)

    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks_successs', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] =
      t 'devise.omniauth_callbacks_failure', kind: 'Google', reason: "#{auth.info.email} is not authorized"
      redirect_to new_user_session_path
      # redirect_to note
    end
  end

  private

  def auth
    @auth ||= ['request.omniauth.auth']
  end
end
