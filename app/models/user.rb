class User < ActiveRecord::Base
  has_many :rhythm_users
  has_many :hive_users
  has_many :competency_users
  has_many :questions
end
