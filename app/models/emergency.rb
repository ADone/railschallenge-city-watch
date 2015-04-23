class Emergency < ActiveRecord::Base
  PARAMS = [:code, :fire_severity, :police_severity, :medical_severity]

  extend FriendlyId
  friendly_id :code

  with_options presence: true do |responder|
    responder.validates :code, uniqueness: true
    responder.validates :fire_severity, :police_severity, :medical_severity,
      numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
