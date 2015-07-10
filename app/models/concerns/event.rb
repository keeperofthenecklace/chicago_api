# Using AS::Concern for mix-in

require 'active_support/concern'

module Event
  extend ActiveSupport::Concern

  included do
    self.send(:upcoming_event)
  end

  module ClassMethods
    def set_date
      #TODO: Consider using an attr_accessor to read or write the attribute
    end
  end

  def upcoming_event (*attr)
    # TODO: Atrributes argument that comes from the serializer, AMS
  end

  private_method :upcoming_event

end
