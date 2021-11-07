class ParseConfigurationFile
  include Base
  include FileHelpers

  EXTENSION = 'json'.freeze

  def initialize(configuration)
    raise MissingParameters, 'The configuration file is missing' if configuration.nil?
    raise InvalidExtension, 'Configuration file must be a JSON file' unless extension(configuration) == EXTENSION

    @configuration = JSON.parse(configuration.read, symbolize_names: true)
  rescue JSON::ParserError
    errors << 'Invalid content'
  rescue MissingParameters, InvalidExtension => e
    errors << e
  end

  def file_parser
    "Provider::#{provider}::Parse#{content_type}File".safe_constantize
  end

  def file_class
    @configuration[:file_type]&.classify&.safe_constantize
  end

  private

  def provider
    @configuration.dig(:file, :provider)&.classify
  end

  def content_type
    @configuration.dig(:file, :content_type)&.classify
  end
end
