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
