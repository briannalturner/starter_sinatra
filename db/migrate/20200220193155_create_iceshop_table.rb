class CreateIceshopTable < ActiveRecord::Migration[5.2]
  def change
    create_table :iceshops do |t|
      t.integer :icecream_id
      t.integer :shop_id
    end
  end
end
