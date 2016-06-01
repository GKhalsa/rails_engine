Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get "find", to: "merchants#find"
          get "find_all", to: "merchants#find_all"
          get "random", to: "merchants#random"
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get "find", to: "customers#find"
          get "find_all", to: "customers#find_all"
          get "random", to: "customers#random"
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get "find", to: "items#find"
          get "find_all", to: "items#find_all"
          get "random", to: "items#random"
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "find", to: "invoices#find"
          get "find_all", to: "invoices#find_all"
          get "random", to: "invoices#random"
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "find", to: "invoice_items#find"
          get "find_all", to: "invoice_items#find_all"
          get "random", to: "invoice_items#random"
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "find", to: "transactions#find"
          get "find_all", to: "transactions#find_all"
          get "random", to: "transactions#random"
        end
      end

    end
  end
end
