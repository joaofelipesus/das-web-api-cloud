class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients, id: :uuid do |t|
      t.string :cpf
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
