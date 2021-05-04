Rails.application.routes.draw do
  resources :gyms, only: %i(index show) do
    collection do
      get :search
    end
  end

  resources :prefectures, only: :index
end
