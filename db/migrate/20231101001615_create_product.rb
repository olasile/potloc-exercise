class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
