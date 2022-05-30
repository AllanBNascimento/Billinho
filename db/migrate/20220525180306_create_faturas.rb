class CreateFaturas < ActiveRecord::Migration[7.0]
  def change
    create_table :faturas do |t|
      t.float :valor_da_fatura
      t.date :data_vencimento
      t.belongs_to :matriculas
      t.text :status

      t.timestamps
    end
  end
end
