module V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    def index
      @users = User.includes(:events).order(created_at: :asc)
      render json: @users, each_serializer: UserSerializer
    end

    def show
      @user = User.find(params[:id])
      render json: @user, serializer: UserSerializer
    end

    # POST /v1/users
    # Create a user
    def Create
      @user = User.new user_params

      if @user.save
        render json: @user, serializer: SessionSerializer, root: nil  # We specify the ActiveModel Serializer object.
      else
        render json: { error: "There was an error creating the user." }, status: :unprocessable_entity
      end
    end

    private
      # Mass-assignment using rails strong params.
      def user_params
        params.require(:user).permit!
      end

  end
end
