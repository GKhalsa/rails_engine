Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      get "merchants/find", to: "merchants#find"
      get "merchants/find_all", to: "merchants#find_all"
      resources :merchants, only: [:index, :show]

      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end

end
