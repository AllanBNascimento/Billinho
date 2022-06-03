# frozen_string_literal: true

class Matricula < ApplicationRecord
  belongs_to :instituicao
  belongs_to :aluno

  has_many :faturas

  validates :valor_total_do_curso, presence: true, numericality: { greater_than: 0 }
  validates :quantidade_de_faturas, presence: true, numericality: { greater_than_or_equal: 1 }
  validates :dia_de_vencimento_das_faturas, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :nome_do_curso, presence: true

  after_create :fatura

  private

  def fatura
    GerarFaturas.perform(self)
  end
end
