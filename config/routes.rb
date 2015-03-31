Reporting::Engine.routes.draw do
  resources :reports, only: [:index, :show] do
    post 'results' => 'results#show'
  end
end
