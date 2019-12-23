class CreateUniversities < ActiveRecord::Migration[5.2]
  def change
    create_table :universities do |t|

      t.string :name
      t.string :location
      t.float :latitude
      t.float :longitude
      t.string :university_image_id

      t.timestamps
    end
    add_index  :universities, :name
  end
end
