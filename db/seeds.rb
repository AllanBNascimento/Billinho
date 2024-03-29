# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Instituicao.create(nome: 'Unifesp', cnpj: '12345678912345', tipo: 'Universidade')
Instituicao.create(nome: 'Anhanguera', cnpj: '22345678912345', tipo: 'Universidade')
Instituicao.create(nome: 'Nova creche', cnpj: '12312378912345', tipo: 'Creche')

Aluno.create(nome: 'Rafael', cpf: '12345678945', data_de_nascimento: '10/10/1995', telefone_celular: '12982546251',
             genero: 'M', meio_de_pagamento: 'Boleto')
Aluno.create(nome: 'Tamiris', cpf: '45645645623', data_de_nascimento: '20/05/1998', telefone_celular: '1233659885',
             genero: 'F', meio_de_pagamento: 'Cartao')
Aluno.create(nome: 'Leonardo', cpf: '78945612345', data_de_nascimento: '15/12/1996', telefone_celular: '1232653254',
             genero: 'M', meio_de_pagamento: 'Boleto')

Matricula.create(valor_total_do_curso: '17000', quantidade_de_faturas: '10', dia_de_vencimento_das_faturas: '10', 
                nome_do_curso: 'Direito', instituicao_id: '1', aluno_id: '1')
Matricula.create(valor_total_do_curso: '5000', quantidade_de_faturas: '50', dia_de_vencimento_das_faturas: '1', 
                nome_do_curso: 'Banco de dados', instituicao_id: '2', aluno_id: '1')
Matricula.create(valor_total_do_curso: '800', quantidade_de_faturas: '8', dia_de_vencimento_das_faturas: '23', 
                nome_do_curso: 'Culinaria', instituicao_id: '3', aluno_id: '2')
Matricula.create(valor_total_do_curso: '57000', quantidade_de_faturas: '48', dia_de_vencimento_das_faturas: '17', 
                nome_do_curso: 'Matematica aplicada', instituicao_id: '1', aluno_id: '3')
Matricula.create(valor_total_do_curso: '10000', quantidade_de_faturas: '10', dia_de_vencimento_das_faturas: '28', 
                nome_do_curso: 'Analise', instituicao_id: '3', aluno_id: '2')
Matricula.create(valor_total_do_curso: '100', quantidade_de_faturas: '1', dia_de_vencimento_das_faturas: '10', 
                nome_do_curso: 'fundamentos', instituicao_id: '3', aluno_id: '3')
