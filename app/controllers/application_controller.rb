#########################################################
# Implementation of a simple token authentication module.
# The token will be composed of two informations:
# the user id followed by the token itself,
# separated by a ':'
########################################################
class ApplicationController < ActionController::API
  include ActionController::Serialization
  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  respond_to :json

  # User Authentication
  # Authenticates the user with OAuth2 Resource Owner Password
  def authenticate_user_from_token!
    auth_token = request.headers['Authorization']

    if auth_token
      authenticate_with_auth_token(auth_token)
    else
      authentication_error
    end
  end

  private

    def authenticate_with_auth_token(auth_token)
      if !auth_token.include?(':')
        authentication_error
        return
      end

      user_id = auth_token.split(':').first
      user = User.where(id: user_id).first

      if user && Devise.secure_compare(user.access_token, auth_token)
        sign_in user, store: false
      else
        authentication_error
      end

    end

    # Authentication Failure
    # A users token is invalid
    def authentication_error
      render json: { error: t('unauthorized') }, status: 401
    end

end
