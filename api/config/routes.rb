Rails.application.routes.draw do
  get 'auth', to: redirect('/auth/google_oauth2/'), as: 'sign_in'
  get 'auth/google_oauth2/callback', to: 'auth/auth#sign_in'

  root 'dashboard#index'
end
