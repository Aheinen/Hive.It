class HiveUser < ActiveRecord::Base
  belongs_to :hive
  belongs_to :user
end
