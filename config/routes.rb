Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "billinho#index"
  get "/billinho", to: "billinho#index"

  resources :instituicao, :aluno, :matricula, :fatura

  get 'instituicao/:instituicao_id/matriculas', to: 'matriculas#dados_instituicao'
  get 'instituicao/:instituicao_id/matriculas/faturas', to: 'faturas#dados_faturas'

  get 'aluno/:aluno_id/matriculas', to: 'matriculas#dados_alunos'
  get 'aluno/:aluno_id/matriculas/faturas', to: 'fatura#dados_alunos'

  get 'matricula/:matricula_id/faturas', to: 'fatura#dados_matriculas'

end
