module Parsers
  module Csv
    class SamsungHealth < Parsers::Csv::Parser
      private

      def extract(csv_data)
        csv_data[2..csv_data.size].map do |row|
          next if row[1].to_i.zero?

          record(row)
        rescue Date::Error
          next
        end.compact
      end

      def record(row)
        {
          date: Date.parse(row[4].to_s),
          active_time: row[1].to_f / 1000,
          calories: row[10].to_f
        }
      end
    end
  end
end
