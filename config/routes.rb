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
    resources :creators, only: [:show, :index, :edit, :update] do
      member do
       get :unsubscribe
       patch :withdraw
       get :entries
      end
    end

    # musician
    resources :musicians, only: [:index, :show]

    # recruitment
    resources :recruitments, only:[:index, :show] do
      resource :entries, only: [:create, :destroy, :index]
    end

  end

  # recruit_user
  get '/recruit_user' => 'recruit_user/homes#top'
  namespace :recruit_user do
    #creator
    resources :creators, only: [:index, :show]

    # musician
    resources :musicians, only: [:show, :index, :edit, :update] do
      member do
       get :unsubscribe
       patch :withdraw
      end
    end

    # entry

    # recruitment
    resources :recruitments, except:[:edit, :destroy] do
      member do
        patch :private
      end
    end

   # issue
   resources :issues, only:[:create, :update, :index, :show]
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
