Rails.application.routes.draw do 
  
  namespace :admin do
    resources :links
    resources :articles do
      collection do
        post :images
      end
    end
    resources :article_categories do
      post :update_nav
    end
    resources :swipers
    resources :navigation_bars
    root to: redirect("admin/dashboard/show")
    get 'dashboard/show'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'welcome/index'
  root 'welcome#index'
  resources :categories, only: [:show]

  resources :article, only: [:index, :show]
  resources :office, only: [:show]
end
