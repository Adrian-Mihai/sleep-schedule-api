module Provider
  module SamsungHealth
    class ParseCsvFile
      include Base
      include FileHelpers

      EXTENSION = 'csv'.freeze

      def initialize(file)
        raise MissingParameters, 'The file is missing' if file.nil?
        raise InvalidExtension, 'File must be a CSV file' unless extension(file) == EXTENSION
      rescue MissingParameters, InvalidExtension => e
        errors << e
      end
    end
  end
end
