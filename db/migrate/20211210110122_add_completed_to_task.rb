# frozen_string_literal: true

class AddCompletedToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :completed, :boolean
  end
end
