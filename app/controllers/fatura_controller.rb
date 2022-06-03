# frozen_string_literal: true

class FaturaController < ApplicationController
  def index
    @faturas = Fatura.all
  end

  def show
    @fatura = Fatura.find(params[:id])
  end

  def new
    @fatura = Fatura.new
  end

  def faturas_da_matricula
    matricula_id = params[:matricula_id]
    @faturas = Fatura.all.where(matricula_id: matricula_id)
  end

  def create
    @fatura = Fatura.new(fatura_params)
    if @fatura.save
      redirect_to fatural_index_path
    else
      render :new
    end
  end

  private

  def fatura_params
    params.require(:fatura).permit(:valor_da_fatura, :data_vencimento, :matricula_id, :status)
  end
end
