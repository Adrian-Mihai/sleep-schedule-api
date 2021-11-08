module Api
  module V1
    class ImportController < ApplicationController
      def import
        service = ParseConfigurationFile.new(sanitize_params[:configuration])
        return render json: { errors: service.errors }, status: :unprocessable_entity unless service.valid?
        return render json: { errors: ['Unknown Provider'] }, status: :unprocessable_entity if service.file_parser.nil?

        extractor = service.file_parser.new(sanitize_params[:file])

        render json: extractor.data, status: :accepted
      end

      private

      def sanitize_params
        params.permit(:configuration, :file)
      end
    end
  end
end
