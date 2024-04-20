Rails.application.routes.draw do

  devise_for :members
  root to: "homes#top"
  resources :members, only: [:index, :show, :edit, :update, :destroy]

  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

end
