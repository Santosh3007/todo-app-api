# frozen_string_literal: true

class Task < ApplicationRecord
  has_many :subtasks
  belongs_to :user

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }
  scope :overdue, -> { incomplete.where("deadline < '#{Time.now}'") }
end
