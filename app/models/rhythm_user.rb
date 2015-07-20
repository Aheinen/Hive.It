class RhythmUser < ActiveRecord::Base
  belongs_to :rhythm
  belongs_to :user
end
