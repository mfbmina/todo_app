class TodoList < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :todo_list

  validates :name, presence: true
  validates :user, presence: true

  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
end
