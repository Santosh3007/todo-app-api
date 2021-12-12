class RemoveTimeFromSubtasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :subtasks, :time, :time
  end
end
