class JsonResponder < ActionController::Responder
  protected

  def json_resource_errors
    { message: resource.errors }
  end
end

class ApplicationController < ActionController::Base
  respond_to :json
  self.responder = JsonResponder

  rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::UnpermittedParameters, with: :unpermitted

  def not_found
    render status: 404
  end

  def unpermitted(exception)
    render json: { message: exception.message }, status: 422
  end
end
