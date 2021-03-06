class CreateAvaliacoesTrabalhos < ActiveRecord::Migration[4.2]
  def change
    create_table :avaliacoes_trabalhos do |t|
      t.integer :situacao
      t.integer :atende_normas
      t.integer :tematica_evento
      t.integer :linha_tematica
      t.integer :linha_id
      t.integer :relevancia
      t.integer :adequacao
      t.integer :consistencia
      t.integer :interlocucao
      t.integer :originalidade
      t.string :parecer
      t.references :linha, index: true, foreign_key: true
      t.references :trabalho, index: true, foreign_key: true
      t.references :organizador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
