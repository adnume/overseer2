class User < ApplicationRecord
  has_secure_password
  has_many :subjects
  has_many :meetings, through: :subjects
  has_many :students, through: :subjects
end
