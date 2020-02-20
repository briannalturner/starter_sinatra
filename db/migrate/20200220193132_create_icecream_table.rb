class CreateIcecreamTable < ActiveRecord::Migration[5.2]
  def change
    create_table :icecreams do |t|
      t.string :flavor
      t.integer :price
      t.string :brand
    end
  end
end
