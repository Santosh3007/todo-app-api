# frozen_string_literal: true

class AddDeadlineToSubtasks < ActiveRecord::Migration[6.1]
  def change
    add_column :subtasks, :deadline, :datetime
  end
end
