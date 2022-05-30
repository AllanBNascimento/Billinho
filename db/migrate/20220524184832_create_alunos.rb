class CreateAlunos < ActiveRecord::Migration[7.0]
  def change
    create_table :alunos do |t|
      t.text :nome
      t.text :cpf
      t.date :data_de_nascimento
      t.integer :telefone_celular
      t.text :genero
      t.text :meio_de_pagamento

      t.timestamps
    end
  end
end
