class Aluno < ApplicationRecord
    has_many :matriculas

    validates :nome, presence: true, uniqueness: true
    validates :cpf, presence: true, numericality: { only_integer: true }, length: { is: 11 }, uniqueness: true
    validates :data_de_nascimento, presence: true
    validate  :verifica_data
    validates :telefone_celular, numericality: { only_integer: true }
    validates :genero, presence: true, inclusion: { in: %w(M F) }
    validates :meio_de_pagamento, presence: true, inclusion: { in: %w(Boleto Cartao) }


    def verifica_data
        if data_de_nascimento > Date.today
            errors.add(:data_de_nascimento, "Data de nascimento inválida!!!")
        end    
    end

end
