require 'csv'

module Parsers
  module Csv
    class Parser
      include Base
      include FileHelpers

      attr_reader :data

      EXTENSION = 'csv'.freeze

      def initialize(file, user_id)
        raise MissingParameters, 'The file is missing' if file.nil?
        raise InvalidExtension, 'File must be a CSV file' unless extension(file) == EXTENSION

        @user = User.find(user_id)
        @data = extract(CSV.read(file, options))
      rescue MissingParameters, InvalidExtension, ActiveRecord::RecordNotFound => e
        errors << e
      end

      private

      def extract(_csv_file)
        raise NotImplementedError, 'Implement in subclass'
      end

      def options
        {}
      end
    end
  end
end
