Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show] do
        collection do
          get "find",         to: "merchants#find"
          get "find_all",     to: "merchants#find_all"
          get "random",       to: "merchants#random"
          get "most_revenue", to: "merchants/most_revenue#index"
        end
        member do
          scope module: "merchants" do
            get "items",    to: "items#index"
            get "invoices", to: "invoices#index"
            get "revenue",  to: "revenue#show"
            get "favorite_customer",               to: "favorite_customer#show"
            get "customers_with_pending_invoices", to: "pending_invoices#index"
          end
        end
      end

      resources :customers, only: [:index, :show] do
        collection do
          get "find",     to: "customers#find"
          get "find_all", to: "customers#find_all"
          get "random",   to: "customers#random"
        end
        member do
          scope module: "customers" do
            get "invoices",          to: "invoices#index"
            get "transactions",      to: "transactions#index"
            get "favorite_merchant", to: "favorite_merchant#show"
          end
        end
      end

      resources :items, only: [:index, :show] do
        collection do
          get "find",     to: "items#find"
          get "find_all", to: "items#find_all"
          get "random",   to: "items#random"
          get "most_revenue", to: "items/most_revenue#index"
        end
        member do
          scope module: "items" do
            get "invoice_items", to: "invoice_items#index"
            get "merchant",      to: "merchant#show"
          end
        end
      end

      resources :invoices, only: [:index, :show] do
        collection do
          get "find",     to: "invoices#find"
          get "find_all", to: "invoices#find_all"
          get "random",   to: "invoices#random"
        end
        member do
          scope module: "invoices" do
            get "transactions",  to: "transactions#index"
            get "invoice_items", to: "invoice_items#index"
            get "items",         to: "items#index"
            get "customer",      to: "customer#show"
            get "merchant",      to: "merchant#show"
          end
        end
      end

      resources :invoice_items, only: [:index, :show] do
        collection do
          get "find",     to: "invoice_items#find"
          get "find_all", to: "invoice_items#find_all"
          get "random",   to: "invoice_items#random"
        end
        member do
          scope module: "invoice_items" do
            get "invoice", to: "invoice#show"
            get "item",    to: "item#show"
          end
        end
      end

      resources :transactions, only: [:index, :show] do
        collection do
          get "find",     to: "transactions#find"
          get "find_all", to: "transactions#find_all"
          get "random",   to: "transactions#random"
        end
        member do
          scope module: "transactions" do
            get "invoice", to: "invoice#show"
          end
        end
      end

    end
  end
end
