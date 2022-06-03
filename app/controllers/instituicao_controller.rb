# frozen_string_literal: true

class InstituicaoController < ApplicationController
  def index
    @instituicoes = Instituicao.all
  end

  def show
    @instituicao = Instituicao.find(params[:id])
  end

  def new
    @instituicao = Instituicao.new
  end

  def create
    @instituicao = Instituicao.new(instituicao_params)
    if @instituicao.save
      redirect_to instituicao_index_path
    else
      render :new
    end
  end

  def destroy
    @instituicao = Instituicao.find(params[:id])
    @instituicao.destroy

    redirect_to instituicao_index_path
  end

  private

  def instituicao_params
    params.require(:instituicao).permit(:nome, :cnpj, :tipo)
  end
end
