FactoryGirl.define do
  factory :measurement do
    experiment_id 1
    resource_id 1
    measurement_value 17
    unit_type "celsius"
    created_at
  end

  sequence :created_at do |n|
    n.hours.ago
  end

end
