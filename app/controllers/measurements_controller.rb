class MeasurementsController < ApplicationController
  # respond_to :json
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  before_action :set_measurement, only: [:show, :edit, :update, :destroy]
  def index
    @measurements = Measurement.all
    render json: @measurements
  end

  def create
    @measurement = Measurement.new(measurement_params)
    if @measurement.save
      # format.json { render :show, status: :created, location: @measurement }
       render json: @measurement
    else
       render json: @measurement.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measurement_params
      params.require(:measurement).permit(:experiment_id, :resource_id, :measurement_value, :unit_type)
    end
end
