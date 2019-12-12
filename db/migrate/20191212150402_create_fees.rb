class CreateFees < ActiveRecord::Migration[5.2]
  def change
    create_table :fees do |t|

      t.integer :price, default: 10000

      t.timestamps
    end
  end
end
