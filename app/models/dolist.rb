class Dolist < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :day, presence: true

end
