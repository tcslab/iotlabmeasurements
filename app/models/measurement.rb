class Measurement
  include Mongoid::Document
  include Mongoid::Timestamps
  field :experiment_id, type: Integer
  field :resource_id, type: Integer
  field :measurement_value, type: String
end
