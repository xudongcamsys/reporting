Reporting::Engine.routes.draw do
  resources :reports, only: [:index, :show] do
    resources :results, only: [:index]
  end
end
