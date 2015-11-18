require 'rails_helper'

RSpec.describe Measurement, type: :model do
  let(:measurements) { FactoryGirl.create_list(:measurement,20) }
  let(:experiment_id) { 1 }
  let(:resource_id) { 1 }
  let(:filters) { {limit:5} }
  describe '.get_measurement_by_experimentresource' do
    it 'given experiment,resource and filters,returns expected measurements' do
      expect(Measurement.get_measurement_by_experimentresource(experiment_id,resource_id,filters)).to_not eq []
    end
  end
end
