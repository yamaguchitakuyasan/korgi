class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|

      t.string :name
      t.string :lecture_image_id
      t.text :description
      t.datetime :held_at
      t.integer :university_id
      t.text :top_message
      t.integer :status
      t.boolean  :active_flag,  default: true

      t.timestamps
    end
    add_index  :lectures, :name
    add_index  :lectures, :university_id
  end
end
