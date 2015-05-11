Reporting::Engine.routes.draw do
  root to: 'reports#index'
  resources :reports, only: [:index, :show] do
    resources :results, only: [:index]
  end
end
