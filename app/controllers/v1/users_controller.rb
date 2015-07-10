module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/users
    # Create a user
    def Create
      @user = User.new user_params

      if @user.save
        render json: @user, serializer: serializer: SessionSerializer, root: nil  # We specify the ActiveModel Serializer object
      else
        render json: { error: "There was an error creating the user." }, status: :unprocessable_entity
      end
    end

    private

      def user_params
        params.require(:user).permit!
      end

  end
end
