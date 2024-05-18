Rails.application.routes.draw do

  devise_for :members
  root to: "homes#top"

  scope module: :public do
    resources :members, only: [:index, :show, :edit, :update, :destroy]
    resources :events, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create]
    end
    get :gallerys, to: 'gallerys#index'
    resources :comments, only: [:destroy]
    resources :event_members, only: [] do
      member do
        post :is_nice, to: 'event_members#is_nice_create'
        delete :is_nice, to: 'event_members#is_nice_destroy'
        post :is_done, to: 'event_members#is_done_create'
        delete :is_done, to: 'event_members#is_done_destroy'
      end
    end
  end

  devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
