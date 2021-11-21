module Api
  module V1
    class ActivitySessionsController < ApplicationController
      def index
        render json: user.activity_sessions.order(date: :desc), status: :ok
      end

      private

      def user
        return @user if defined? @user

        @user = User.find(params[:user_id])
      end
    end
  end
end
