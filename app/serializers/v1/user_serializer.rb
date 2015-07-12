class V1::UserSerializer < ActiveModel::Serializer
  # cache key: 'users', expires_in: 2.hours

  attributes :id, :first_name, :last_name, :email, :username

  has_many :events

  # url [:users, :events]
end
