class MeasurementsController < ApplicationController
  def index
    @measurements = Measurement.all.as_json
    render json: @measurements
  end
end
