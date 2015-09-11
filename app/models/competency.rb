class Competency < ActiveRecord::Base
  has_many :competency_users
  has_many :users, through: :competency_users
  has_many :content
end
