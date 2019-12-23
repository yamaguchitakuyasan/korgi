class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|

      t.string :name
      t.string :professor_image_id
      t.text :profile
      t.integer :university_id

      t.timestamps
    end
    add_index  :professors, :name
  end
end
