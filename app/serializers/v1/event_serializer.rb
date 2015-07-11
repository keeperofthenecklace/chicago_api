class V1::EventSerializer < ActiveModel::Serializer

  # Attributes that are serialized.
  attributes :id, :title, :event_begins_at, :event_ends_at

  # Associations
  belongs_to :user, serializer: V1::UserSerializer
end
