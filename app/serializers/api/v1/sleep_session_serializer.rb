module Api
  module V1
    class SleepSessionSerializer < ActiveModel::Serializer
      attributes :uuid, :date, :went_to_bed, :woke_up, :sleep_quality, :time_in_bed, :movements_per_hour

      def went_to_bed
        object.went_to_bed.localtime.strftime('%T')
      end

      def woke_up
        object.woke_up.localtime.strftime('%T')
      end
    end
  end
end
