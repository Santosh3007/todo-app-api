class AddTagColorToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :tagColor, :string
  end
end
