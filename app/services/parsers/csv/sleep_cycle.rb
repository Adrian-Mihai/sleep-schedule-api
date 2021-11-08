module Parsers
  module Csv
    class SleepCycle < Parsers::Csv::Parser
      private

      def extract(csv_data)
        csv_data[1..csv_data.size].map do |row|
          record(row)
        rescue ArgumentError
          next
        end.compact
      end

      def options
        { col_sep: ';' }
      end

      def record(row)
        {
          went_to_bed: Time.parse(row[0].to_s).utc,
          woke_up: Time.parse(row[1].to_s).utc,
          sleep_quality: row[2],
          movements_per_hour: row[9],
          time_in_bed: row[10],
          snore_time: row[14]
        }
      end
    end
  end
end
