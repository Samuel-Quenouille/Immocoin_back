class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image
      t.string :city
      t.integer :zip_code

      t.timestamps
    end
  end
end
