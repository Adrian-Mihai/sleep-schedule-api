module Api
  module V1
    class UsersController < ApplicationController
      def show
        render json: user, status: :ok
      end

      def create
        user = User.new(sanitize_params.merge(uuid: SecureRandom.uuid))
        user.save!
        render json: user, status: :created
      end

      def update
        user.update!(sanitize_params.except(:email))
        render json: user, status: :created
      end

      private

      def user
        return @user if defined? @user

        @user = User.find(params[:id])
      end

      def sanitize_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end
