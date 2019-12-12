class RemoveUserIdFromLectures < ActiveRecord::Migration[5.2]
  def change
    remove_column :lectures, :user_id, :integer
  end
end
