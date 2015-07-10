class Event < ActiveRecord::Base

  #Association
  belongs_to :user

  validates :title, presence: true
  validates :event_begins_at, presence: true
  validates :event_ends_at, presence: true
end
