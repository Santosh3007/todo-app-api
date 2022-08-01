# frozen_string_literal: true

class ChangeDefaultValueforCompleted < ActiveRecord::Migration[6.1]
  def change
    change_column_default :tasks, :completed, false
  end
end
