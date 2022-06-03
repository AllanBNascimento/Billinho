# frozen_string_literal: true

class CreateFaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :faturas do |t|
      t.float :valor_da_fatura
      t.date :data_vencimento
      t.text :status
      t.references :matricula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
