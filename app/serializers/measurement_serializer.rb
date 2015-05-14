class MeasurementSerializer < ActiveModel::Serializer
  attributes :experiment_id, :resource_id, :measurement_value, :unit_type, :created_at, :updated_at
end
