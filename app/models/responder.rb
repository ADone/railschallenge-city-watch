class Responder < ActiveRecord::Base
  PARAMS = [:type, :name, :on_duty, :capacity]

  extend FriendlyId
  friendly_id :name

  self.inheritance_column = nil

  with_options presence: true do |responder|
    responder.validates :name, uniqueness: true
    responder.validates :capacity, inclusion: { in: 1..5 }
    responder.validates :type
  end
end
