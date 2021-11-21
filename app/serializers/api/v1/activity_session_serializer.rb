module Api
  module V1
    class ActivitySessionSerializer < ActiveModel::Serializer
      attributes :uuid, :date, :active_time, :calories
    end
  end
end
