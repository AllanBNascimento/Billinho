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
    respond_to do |format|
      if @instituicao.save
        format.html { redirect_to instituicao_index_path, notice: 'Instituição cadastrada.' }
        format.json { render :show, status: :created, location: @instituicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instituicao.errors, status: :unprocessable_entity }
      end
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
