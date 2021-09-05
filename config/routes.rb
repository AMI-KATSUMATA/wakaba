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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
