Rails.application.routes.draw do

  mount Reporting::Engine => "/reporting"

  root to: 'welcome#index'
end
