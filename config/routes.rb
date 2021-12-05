Rails.application.routes.draw do 

  namespace :admin do
    resource :companies
    resources :organizations
    resources :image_links
    resources :group_banners
    resources :scientific_banners
    resources :settings do
      collection do
        post :clear_home_bg
      end
    end
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
  resources :organizations
  resources :articles, only: [:index, :show]
  resources :office, only: [:show]
  resources :links, only: [:index]
end
