class EmergenciesController < ApplicationController
  def index
    @emergencies = Emergency.all
    respond_with @emergencies, root: 'emergencies'
  end

  def create
    @emergency = Emergency.create(emergency_params)
    respond_with @emergency, root: 'emergency'
  end

  def show
    @emergency = Emergency.friendly.find(params[:id])
    respond_with @emergency, root: 'emergency'
  end

  def update
    @emergency = Emergency.friendly.find(params[:id])
    @emergency.update(emergency_params)
    respond_with @emergency, root: 'emergency'
  end

  protected

  def emergency_params
    params.require(:emergency).permit(Emergency::PARAMS)
  end
end
