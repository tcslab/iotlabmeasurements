require 'rails_helper'

RSpec.describe MeasurementsController, type: :controller do
  let(:measurements) { FactoryGirl.create_list(:measurement,20) }
  let(:experiment_id) { 1 }
  let(:resource_id) { 1 }
  let(:filters) { {experiment_id:experiment_id,resource_id:resource_id} }
  let(:limit) { 3 }

  describe 'GET #get_measurement_by_experimentresource' do
    it 'Given filters, return corresponding measurements' do
      counter = measurements
      params = {filters:filters,limit:limit}
      get :get_measurement_by_experimentresource, params, format: 'json'
      measurements = JSON.parse(response.body)
      expect(measurements.count).to eq limit
    end
  end
end
