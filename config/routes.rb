Rails.application.routes.draw do

  root to: "homes#top"

  devise_for :users,skip: [:passwords],controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  namespace :user do
    resources :pets,only:[:new,:create,:show,:edit,:update]
    resources :questions,only:[:index]
    get 'questions/practice/:question_id', to: 'questions#practice', as: 'question_practice'
    post 'questions/test'
    get 'answer_results/congrats'
  end

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :questions,only:[:new,:create,:show,:edit,:update,:destroy]
    resources :pets,only:[:index,:show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
