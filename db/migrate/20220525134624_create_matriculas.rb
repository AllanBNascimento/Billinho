# frozen_string_literal: true

class CreateMatriculas < ActiveRecord::Migration[7.0]
  def change
    create_table :matriculas do |t|
      t.float :valor_total_do_curso
      t.integer :quantidade_de_faturas
      t.integer :dia_de_vencimento_das_faturas
      t.text :nome_do_curso
      t.references :instituicao, null: false, foreign_key: true
      t.references :aluno, null: false, foreign_key: true

      t.timestamps
    end
  end
end
