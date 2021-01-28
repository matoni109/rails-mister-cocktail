Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails, only: [ :new, :edit, :create, :index, :show, :destroy ] do

    resources :doses, only: [:create]
  end

  resources :doses, only: [ :destroy ]
end
