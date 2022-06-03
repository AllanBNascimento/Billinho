# frozen_string_literal: true

class Instituicao < ApplicationRecord
  has_many :matriculas

  validates :nome, presence: true, uniqueness: true
  validates :cnpj, presence: true, numericality: { only_integer: true }, length: { is: 14 }, uniqueness: true
  validates :tipo, presence: true, inclusion: { in: %w[Universidade Escola Creche] }
end
