# frozen_string_literal: true

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
    respond_to do |format|
      if @aluno.save
        format.html { redirect_to aluno_index_path, notice: 'Aluno cadastrado.' }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def aluno_params
    params.require(:aluno).permit(:nome, :cpf, :data_de_nascimento, :telefone_celular, :genero, :meio_de_pagamento)
  end
end
