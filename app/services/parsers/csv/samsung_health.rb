module Parsers
  module Csv
    class SamsungHealth < Parsers::Csv::Parser
      private

      def extract(csv_data)
        csv_data[2..csv_data.size].map do |row|
          next if row[0].to_i.zero?

          record(row)
        rescue Date::Error
          next
        end.compact
      end

      def record(row)
        {
          date: Date.parse(row[4].to_s).to_s,
          steps: row[0],
          distance: row[9],
          calories: row[10],
          run: row[13],
          walk: row[15]
        }
      end
    end
  end
end
