Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :cocktails, only: [ :new, :edit, :create, :index, :show ] do

    resources :doses, only: [ :new, :create, :show, :index ]
  end


end
