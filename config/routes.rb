# frozen_string_literal: true

Rails.application.routes.draw do
  draw :seo
  draw :errors

  scope '/:locale', locale: /#{I18n.available_locales.join('|')}/ do
    resources :about, only: :index
    resources :team, only: :index
    resources :curriculum_vitae, only: :index
    resources :home, only: :index
    root 'home#index'
  end

  get '/*path', to: redirect("/#{I18n.default_locale}/%{path}"),
                constraints: { path: %r{(?!(#{I18n.available_locales
                                                  .join('|')})\/).*} }
end
