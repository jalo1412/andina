Rails.application.routes.draw do

  get 'users/added'

  get 'orders/done'

  get 'store/index'
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :orders
  resources :line_items
  resources :carts do
    collection do
      get 'added'
      get 'show'
    end
  end
  root 'welcome#landing', as: 'welcome_landing'
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
