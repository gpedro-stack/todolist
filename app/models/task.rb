class Task < ApplicationRecord
  include Completed
  belongs_to :dolist

  validates :activity, presence: true




end
