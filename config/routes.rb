Rails.application.routes.draw do
    devise_for :musicians, controllers: {
  sessions:      'musicians/sessions',
  passwords:     'musicians/passwords',
  registrations: 'musicians/registrations'
}

  devise_for :creators, controllers: {
  sessions:      'creators/sessions',
  passwords:     'creators/passwords',
  registrations: 'creators/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}

  # apply_user
  root to: 'apply_user/homes#top'
  scope module: :apply_user do
    # creator
    resources :creators, only: [:show, :edit, :update] do
      member do
       get :unsubscribe
       patch :withdraw
      end
    end

    # musician
    resources :musicians, only: [:index, :show] do
      post 'favorites' => 'favorites#create_musicians'
      delete 'favorites' => 'favorites#destroy_musicians'
    end

    # artwork
    resources :artworks, except: [:index, :destroy] do
      member do
        patch :private
      end
    end

    # recruitment/entry
    resources :recruitments, only:[:index, :show] do
      resource :entries, only: [:create, :destroy]
      post 'favorites' => 'favorites#create_recruitments'
      delete 'favorites' => 'favorites#destroy_recruitments'
    end

    # entry
    get '/entries' => 'entries#index', as:'entries'

    # favorite
    get '/favorite_recruitments' => 'favorites#favorite_recruitments', as:'favorite_recruitments'
    get '/favorite_musicians' => 'favorites#favorite_musicians', as:'favorite_musicians'

    # issue
    resources :issues, only:[:show, :index] do
      member do
        get :room
      end
    end


    # message
    resource :message, only:[:create]

    # notification
    resources :notifications, only:[:index]

    # search
    get '/search' => 'searches#search'


  end

  # recruit_user
  get '/recruit_user' => 'recruit_user/homes#top'
  namespace :recruit_user do
    #creator
    resources :creators, only: [:index, :show]

    # musician
    resources :musicians, only: [:show, :edit, :update] do
      member do
       get :unsubscribe
       patch :withdraw
      end
    end

    # artwork
    resources :artworks, only:[:index, :show]

    # recruitment
    resources :recruitments, except:[:edit, :index, :destroy] do
      resource :issue, only:[:create]
      resources :recruitment_postscripts, only: [:create, :destroy]
      member do
        patch :private
      end
    end

    # issue
    resources :issues, only:[:show, :update, :index] do
      member do
        get :room
      end
    end

    # message
    resource :message, only:[:create]

    # notification
    resources :notifications, only:[:index]

    # search
    get '/search' => 'searches#search'

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
