class CreateRelationshipsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :shop_id
      t.integer :icecream_id
    end
  end
end
