class Subject < ApplicationRecord
  has_many :students
  has_many :meetings
  def self.not_deleted
    self.all
  end
end
