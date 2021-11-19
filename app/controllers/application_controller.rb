class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_response

  def version
    version = File.read('VERSION').strip
    render json: { version: version }, status: :ok
  end

  private

  def not_found_response(error)
    logger.error("Error: #{error.inspect}\nBacktrace: #{error.backtrace.join("\n \t")}")
    render json: { messages: ["#{error.model} not found"] }, status: :not_found
  end

  def record_invalid_response(error)
    logger.error("Error: #{error.inspect}\nBacktrace: #{error.backtrace.join("\n \t")}")
    render json: { messages: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end
