Rails.application.routes.draw do
     root 'home#top'
     get 'home/about'
     get 'search' => 'searches#search'

     devise_for :users, contorollers: {
       sessions: 'users/sessions',registrations: 'user/registration'
     }

       resources :users do
         member do
           get :following,:followers
         end
       end
       
       resources :relationships, only: [:create, :destroy]

       
       resources :books do
         resource :favorites, only: [:create, :destroy]
         resources :book_comments, only: [:create, :destroy]
         
       end
        
     


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end