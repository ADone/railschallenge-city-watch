class RespondersController < ApplicationController
  def index
    @responders = Responder.all
    respond_with @responders, root: 'responders'
  end

  def create
    @responder = Responder.create(responder_params)
    respond_with @responder, root: 'responder'
  end

  def show
    @responder = Responder.friendly.find(params[:id])
    respond_with @responder, root: 'responder'
  end

  def update
    @responder = Responder.friendly.find(params[:id])
    @responder.update(responder_params)
    respond_with @responder, root: 'responder'
  end

  protected

  def responder_params
    params.require(:responder).permit(Responder::PARAMS)
  end
end
