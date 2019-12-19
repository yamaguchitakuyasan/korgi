class AddTimeToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :required_time, :integer
  end
end
