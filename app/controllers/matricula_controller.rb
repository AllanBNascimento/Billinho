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
    respond_to do |format|
      if @matricula.save
        format.html { redirect_to billinho_path, notice: 'Matricula cadastrada.' }
        format.json { render :show, status: :created, location: @matricula }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def matricula_params
    params.require(:matricula).permit(:valor_total_do_curso, :quantidade_de_faturas,
                                      :dia_de_vencimento_das_faturas, :nome_do_curso, :instituicao_id, :aluno_id)
  end
end
