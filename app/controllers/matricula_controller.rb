# frozen_string_literal: true

class MatriculaController < ApplicationController
  def index
    @matriculas = Matricula.all
  end

  def show
    @matricula = Matricula.find(params[:id])
  end

  def new
    @matricula = Matricula.new
  end

  def matriculas_do_aluno
    aluno_id = params[:aluno_id]
    @matriculas = Matricula.all.where(aluno_id: aluno_id)
  end

  def matriculas_da_instituicao
    instituicao_id = params[:instituicao_id]
    @matriculas = Matricula.all.where(instituicao_id: instituicao_id)
  end

  def create
    @matricula = Matricula.new(matricula_params)
    if @matricula.save
      redirect_to billinho_path
    else
      render :new
    end
  end

  private

  def matricula_params
    params.require(:matricula).permit(:valor_total_do_curso, :quantidade_de_faturas,
                                      :dia_de_vencimento_das_faturas, :nome_do_curso, :instituicao_id, :aluno_id)
  end
end
