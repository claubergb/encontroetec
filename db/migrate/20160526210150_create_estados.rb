class CreateEstados < ActiveRecord::Migration[4.2]
  def change
    create_table :estados do |t|
      t.integer :codigo
      t.string :nome
      t.string :sigla
      t.string :regiao
      t.references :pais

      t.timestamps null: false
    end
  end
end
