class Rhythm < ActiveRecord::Base
  has_many :rhythm_users
  has_many :users, through: :rhythm_users
end
