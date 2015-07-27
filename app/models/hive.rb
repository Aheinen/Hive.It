class Hive < ActiveRecord::Base
  has_many :contents
  belongs_to :question
  has_many :hive_users
  has_many :messages
end
