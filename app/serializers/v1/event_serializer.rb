class V1::EventSerializer < ActiveModel::Serializer

  attributes :id, :title, :event_begins_at, :event_ends_at

  # belongs_to :user, serializer: V1::UserSerializer

  # url :event
  def title
    # object.body[0..200]
  end
end
