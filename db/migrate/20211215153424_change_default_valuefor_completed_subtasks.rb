class ChangeDefaultValueforCompletedSubtasks < ActiveRecord::Migration[6.1]
  def change
    change_column_default :subtasks, :completed, false
  end
end
