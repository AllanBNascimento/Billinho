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
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
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
    instituicao_id = params[:instituicao_id]
    institution = Instituicao.find(instituicao_id)
    institution.destroy
      
    redirect_to instituicao_index_path :notice => "Instituição deletada com sucesso"
  end

  private

  def instituicao_params
    params.permit(:nome, :cnpj, :tipo)
  end
end
