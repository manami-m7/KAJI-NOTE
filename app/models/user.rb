class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :task_histories, dependent: :destroy
  has_many :tasks, dependent: :destroy
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :email, presence: true

  # accepts_nested_attributes_for
  # accepts_nested_attributes_for :group
end
