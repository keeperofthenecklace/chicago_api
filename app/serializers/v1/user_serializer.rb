class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :username

  has_many :events
end
