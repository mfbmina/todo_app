class Task < ApplicationRecord
  belongs_to :todo_list, inverse_of: :tasks

  validates :description, presence: true
  validates :todo_list, presence: true
end
