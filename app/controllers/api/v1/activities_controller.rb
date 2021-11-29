module Api
  module V1
    class ActivitiesController < ApplicationController
      def create
        service = Parsers::Json::Configuration.new(sanitize_params[:configuration])
        return render json: { errors: service.errors }, status: :unprocessable_entity unless service.valid?
        return render json: { errors: ['Unknown Provider'] }, status: :unprocessable_entity if service.file_parser.nil?
        return render json: { errors: ['Unknown Activity'] }, status: :unprocessable_entity if service.activity_type.nil?

        extractor = service.file_parser.new(sanitize_params[:file], user.id)
        return render json: { errors: extractor.errors }, status: :unprocessable_entity unless extractor.valid?

        extractor.data.map! { |activity| activity.merge(uuid: SecureRandom.uuid) }
        service.activity_type.create(extractor.data)

        render json: {}, status: :created
      end

      private

      def sanitize_params
        params.permit(:user_id, :configuration, :file)
      end

      def user
        return @user if defined? @user

        @user = User.find(sanitize_params[:user_id])
      end
    end
  end
end
