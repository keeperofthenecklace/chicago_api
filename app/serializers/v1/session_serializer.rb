module V1
  class SessionSerializer < ActiveModel::Serializer
    attributes :email, :token_type, :user_id, :access_token

    def user_id
      object.id
    end

    def token_type
      'Love_Is_An_Adventure!'
    end

  end
end
