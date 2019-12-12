class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|

      t.integer :user_id
      t.integer :fee_id
      t.boolean  :active, default: true

      t.timestamps
    end
  end
end
