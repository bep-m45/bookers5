Rails.application.routes.draw do

     devise_for :users, contorollers: {
       sessions: 'users/sessions',registrations: 'user/registration'
     }

       resources :users, only: [:show, :index, :update, :edit]
       
       resources :books do
         resource :favorites, only: [:create, :destroy]
         resources :book_comments, only: [:create, :destroy]
         
       end
        
     root 'home#top'
     get 'home/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end