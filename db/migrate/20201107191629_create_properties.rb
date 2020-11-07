class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :property_name
      t.integer　address :rent
      t.integer :age
      t.text :remarks

      t.timestamps
    end
  end
end
