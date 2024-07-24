Rails.application.routes.draw do
  resources :students do
    collection { post :import }
  end

  root 'students#index'
end
