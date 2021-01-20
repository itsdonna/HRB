class RemoveProjIdFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :proj_id, :integer
  end
end
