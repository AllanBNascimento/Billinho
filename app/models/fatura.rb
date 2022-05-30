class Fatura < ApplicationRecord
    belongs_to :matriculas

    validates :valor_da_fatura, presence: true
    validates :data_vencimento, presence: true
    validates :status, presence: true, inclusion: { in: %w(Aberta Atrasada Paga) }
end
