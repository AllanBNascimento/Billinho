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

    def dados_alunos
        aluno_id = params[:aluno_id]
        matriculas = Matricula.join(:aluno).where(aluno_id: aluno_id)
    end

    def dados_instituicao
        instituicao_id = params[:instituicao_id]
        matriculas = Matricula.join(:instituicao).where(instituicao_id: instituicao_id)
    end

    def create
        @matricula = Matricula.new(matricula_params)
        if @matricula.save

            # GERAÇÃO AUTOMATICA DA FATURA
    
            # valor = (@matricula.valor_total_do_curso / @matricula.quantidade_de_faturas)

            # hoje = Date.today.strftime('%d').to_i
            # dia_v = @matricula.dia_de_vencimento_das_faturas.to_i
            
            # i = (hoje > dia_v) ? 1 : 0
            # if(hoje > dia_v)
            #     for i in 1..@matricula.quantidade_de_faturas do
            #         vencimento_string = "#{dia_v}#{Date.today.strftime('/%m/%Y')}"
            #         vencimento = Date.parse(vencimento_string).next_month(i)
            #         @fatura = Fatura.new(valor_da_fatura:valor, data_vencimento: vencimento, matricula_id:@matricula.id, status:'Aberta')
            #         @fatura.save
            #     end
            # else
            #     for i in 0..@matricula.quantidade_de_faturas-1 do
            #         vencimento_string = "#{dia_v}#{Date.today.strftime('/%m/%Y')}"
            #         vencimento = Date.parse(vencimento_string).next_month(i)
            #         @fatura = Fatura.new(valor_da_fatura:valor, data_vencimento: vencimento, matricula_id:@matricula.id, status:'Aberta')
            #         @fatura.save
            #     end
            # end

            redirect_to matricula_index_path
        else
            render :new
        end
    end

    private
        def matricula_params
            params.require(:matricula).permit(:valor_total_do_curso, :quantidade_de_faturas, :dia_de_vencimento_das_faturas, :nome_do_curso, :instituicao_id, :aluno_id)
        end
end
