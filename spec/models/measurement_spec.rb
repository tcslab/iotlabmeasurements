require 'rails_helper'

RSpec.describe Measurement, type: :model do
  context 'validations' do
    before { FactoryGirl.build(:node) }

    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :latitude }
    it { is_expected.to validate_presence_of :longitude }
    it { is_expected.to validate_presence_of :urn }

  end
end
