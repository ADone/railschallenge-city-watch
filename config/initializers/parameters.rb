ActiveSupport.on_load(:action_controller) do
  ActionController::Parameters.action_on_unpermitted_parameters = :raise
end