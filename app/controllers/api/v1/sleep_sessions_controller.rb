module Api
  module V1
    class SleepSessionsController < ApplicationController
      def index
        sleep_sessions = if interval
                           user.sleep_sessions.where(date: interval)
                         else
                           user.sleep_sessions
                         end
        render json: sleep_sessions, status: :ok
      end

      private

      def user
        return @user if defined? @user

        @user = User.find(params[:user_id])
      end

      def interval
        return if params.dig(:date, :start).nil? || params.dig(:date, :end).nil?

        Date.parse(params.dig(:date, :start))..Date.parse(params.dig(:date, :end))
      end
    end
  end
end
