require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:measurements) { FactoryGirl.create_list(:measurement,20) }
  let(:experiment_id) { 1 }
  let(:resource_id) { 1 }
  let(:filters) { {experiment_id:experiment_id,resource_id:resource_id} }
  let(:limit1) { nil }
  let(:limit2) { 10 }
  describe '.get_measurement_by_experimentresource' do
    it 'given measurement attributes, returns expected measurements' do
      counter = measurements.count
      expect(Measurement.get_measurement_by_experimentresource(attrs:filters,limit:limit1)).to_not eq []
    end
    it 'given measurement attributes and limit returns the number of expected measurements' do
      counter = measurements.count
      expect(Measurement.get_measurement_by_experimentresource(attrs:filters,limit:limit2).count).to eq limit2
    end
  end
end
