Rails.application.routes.draw do

  devise_for :members
  root to: "homes#top"
  scope module: :public do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
  end

  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
