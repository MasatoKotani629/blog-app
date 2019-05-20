Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'blogs#index'
  resources :blogs, only: [:index, :new, :create, :destroy, :edit, :update] do
    resources :comments, only: [:create]
  end
  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end

end