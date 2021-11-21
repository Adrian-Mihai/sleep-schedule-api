module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :uuid, :email
    end
  end
end
