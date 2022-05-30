class CreateInstituicoes < ActiveRecord::Migration[7.0]
  def change
    create_table :instituicoes do |t|
      t.text :nome
      t.text :cnpj
      t.text :tipo

      t.timestamps
    end
  end
end
