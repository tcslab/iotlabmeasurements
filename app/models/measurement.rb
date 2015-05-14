class Measurement
  include Mongoid::Document
  include Mongoid::Timestamps
  field :experiment_id, type: Integer
  field :resource_id, type: Integer
  field :measurement_value, type: String
  field :unit_type, type: String

  def self.get_measurement_by_experiment(experiment_id)
    Measurement.where(experiment_id: experiment_id).only(:id,:experiment_id, :resource_id,:measurement_value,:unit_type, :created_at, :updated_at)
  end

  def self.get_measurement_by_resource(resource_id)
    Measurement.where(resource_id: resource_id).only(:id,:experiment_id, :resource_id,:measurement_value,:unit_type, :created_at, :updated_at)
  end

  def self.get_measurement_before(provided_date)
    Measurement.where(:created_at.lt => provided_date).only(:id,:experiment_id, :resource_id,:measurement_value,:unit_type, :created_at, :updated_at)
  end

  def self.get_measurement_after(provided_date)
    Measurement.where(:created_at.gt => provided_date).only(:id,:experiment_id, :resource_id,:measurement_value,:unit_type, :created_at, :updated_at)
  end

end

