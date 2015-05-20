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

  def get_measurement_by_experiment_id
    @measurements = Array.new
    experiment_id = params["experiment_id"]
    @measurements = Measurement.get_measurement_by_experiment(experiment_id).to_a
    render json: @measurements
  end

  def get_measurement_by_resource_id
    @measurements = Array.new
    resource_id = params["resource_id"]
    @measurements = Measurement.get_measurement_by_resource(resource_id).to_a
    render json: @measurements
  end

  def get_measurement_by_experimentresource
    @measurements = Array.new
    experiment_id = params["experiment_id"]
    resource_id = params["resource_id"]
    @measurements = Measurement.get_measurement_by_experimentresource(experiment_id,resource_id).to_a
    binding.pry
    render json: @measurements
  end

  def get_measurements_before
    provided_date = DateTime.parse(params[:date])
    @measurements = Array.new
    @measurements = Measurement.get_measurement_before(provided_date).to_a
    render json: @measurements
  end

  def get_measurements_after
    provided_date = DateTime.parse(params[:date])
    @measurements = Array.new
    @measurements = Measurement.get_measurement_after(provided_date).to_a
    render json: @measurements
  end

  def get_measurements_last
    @measurements = Array.new
    @measurements = Measurement.get_last_measurement.to_a
    render json: @measurements.last
  end

  def get_max
    unit = params["unit_type"]
    experiment_id = params["experiment_id"]
    @measurements = Measurement.get_max(experiment_id, unit)
    render json: @measurements
  end

  def get_min
    unit = params["unit_type"]
    experiment_id = params["experiment_id"]
    @measurements = Measurement.get_min(experiment_id, unit)
    render json: @measurements
  end

  def get_average
    unit = params["unit_type"]
    experiment_id = params["experiment_id"]
    @measurements = Measurement.get_average(experiment_id, unit)
    render json: @measurements
  end

  def is_resource_availabile
    resource_id = params["resource_id"]
    @measurement_status = Measurement.is_resource_availabile(resource_id)
    message = "true"
    message = "false" if !@measurement_status
    render json: message.as_json
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
