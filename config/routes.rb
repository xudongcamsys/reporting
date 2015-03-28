Reporting::Engine.routes.draw do
  resources :reports, only: [:index]

end
