class Measurement
  include Mongoid::Document
  include Mongoid::Timestamps
  field :experiment_id, type: Integer
  field :resource_id, type: Integer
  field :measurement_value, type: Float
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

  def self.get_measurement_by_experimentresource(experiment_id, resource_id)
    Measurement.where(experiment_id: experiment_id).and(resource_id: resource_id).only(:id,:experiment_id, :resource_id,:measurement_value,:unit_type, :created_at, :updated_at)
  end

  def self.get_last_measurement(resource_id: -1)
    result = nil
    if resource_id>0 
      result = Measurement.where(resource_id: resource_id).last
    else
      Measurement.last
    end
  end

  def self.get_max(experiment_id,resource_id)
    Measurement.where(resource_id: resource_id).and(experiment_id: experiment_id).max(:measurement_value)
  end

  def self.get_min(experiment_id,resource_id)
    Measurement.where(resource_id: resource_id).and(experiment_id: experiment_id).min(:measurement_value)
  end

  def self.get_average(experiment_id,resource_id)
    Measurement.where(resource_id: resource_id).and(experiment_id: experiment_id).avg(:measurement_value)
  end

  def self.is_resource_availabile(resource_id)
    available = true
    measurement = Measurement.where(resource_id: resource_id).order_by([:created_at, :desc]).limit(1).first
    available = false if measurement.measurement_value.nil?
    return available
  end

end
