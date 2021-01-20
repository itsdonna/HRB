class RemoveUidFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :uid, :integer
  end
end
