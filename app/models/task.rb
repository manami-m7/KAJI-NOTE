class Task < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :user
  has_many :task_histories, dependent: :destroy

  validates :task_name, presence: true
end
