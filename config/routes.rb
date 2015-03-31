Reporting::Engine.routes.draw do
  resources :reports, only: [:index, :show] do
    resource :results, only: [:show]
  end
end
