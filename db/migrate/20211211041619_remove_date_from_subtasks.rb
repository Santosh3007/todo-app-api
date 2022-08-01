# frozen_string_literal: true

class RemoveDateFromSubtasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :subtasks, :date, :date
  end
end
