module Parsers
  module Csv
    class SleepCycle < Parsers::Csv::Parser
      private

      def extract(csv_data)
        csv_data[1..csv_data.size].map do |row|
          record(row)
        rescue ArgumentError => e
          Rails.logger.warn e.message
          next
        end.compact
      end

      def options
        { col_sep: ';' }
      end

      def record(row)
        {
          date: Date.parse(row[1].to_s),
          went_to_bed: Time.parse(row[0].to_s).utc,
          woke_up: Time.parse(row[1].to_s).utc,
          sleep_quality: row[2].to_i,
          movements_per_hour: row[9].to_f,
          time_in_bed: row[10].to_f
        }
      end
    end
  end
end
