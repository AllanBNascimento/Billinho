class AlunoController < ApplicationController
    def index
        @alunos = Aluno.all
    end

    def show
        @aluno = Aluno.find(params[:id])
    end

    def new
        @aluno = Aluno.new
    end

    def create
        @aluno = Aluno.new(aluno_params)
        if @aluno.save
            redirect_to aluno_index_path
        else
            render :new
        end
    end

    private
        def aluno_params
            params.require(:aluno).permit(:nome, :cpf, :data_de_nascimento, :telefone_celular, :genero, :meio_de_pagamento)
        end
end
