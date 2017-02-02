class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.boolean :purchase
      t.string :item_name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
