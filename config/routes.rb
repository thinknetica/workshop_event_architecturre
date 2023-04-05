Rails.application.routes.draw do
  mount RailsEventStore::Browser => '/res' if Rails.env.development?

  resources :rides, only: [:create] do
    post :accept
    post :reject
  end
end
