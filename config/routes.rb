# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'billinho#index'
  get '/billinho', to: 'billinho#index'

  resources :instituicao, :aluno, :matricula, :fatura

  get 'instituicao/:instituicao_id/matricula', to: 'matricula#matriculas_da_instituicao'
  get 'instituicao/:instituicao_id/matricula/new', to: 'matricula#new'
  get 'instituicao/:instituicao_id/matricula/:matricula_id/fatura', to: 'fatura#faturas_da_matricula'

  get 'aluno/:aluno_id/matricula', to: 'matricula#matriculas_do_aluno'
  get 'aluno/:aluno_id/matricula/new', to: 'matricula#new'
  get 'aluno/:aluno_id/matricula/:matricula_id/fatura', to: 'fatura#faturas_da_matricula'
end
