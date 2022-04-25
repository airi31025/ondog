Rails.application.routes.draw do

  namespace :admin do
    get 'pets/index'
    get 'pets/show'
  end
  namespace :admin do
    get 'questions/new'
    get 'questions/show'
    get 'questions/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :user do
    get 'answer_results/congrats'
  end
  namespace :user do
    get 'questions/index'
    get 'questions/practice'
    get 'questions/test'
  end
  namespace :user do
    get 'pets/new'
    get 'pets/show'
    get 'pets/edit'
  end
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
