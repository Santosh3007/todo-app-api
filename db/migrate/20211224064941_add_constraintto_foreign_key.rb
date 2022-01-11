class AddConstrainttoForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :subtasks, :tasks
    add_foreign_key :subtasks, :tasks, on_delete: :cascade
  end
end
