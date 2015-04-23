Rails.application.routes.draw do
  resources :emergencies, except: [:new, :edit, :destroy], defaults: { format: :json }
  resources :responders,  except: [:new, :edit, :destroy], defaults: { format: :json }
end
