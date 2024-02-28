class CreateBuildings < ActiveRecord::Migration[7.0]
  def change
    create_table :buildings do |t|
      t.string :name
      t.references :onwer, polymorphic: true, null: false

      t.timestamps
    end
  end
end
