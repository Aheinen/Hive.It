class RhythmsController < ApplicationController

  def index
    @rhythms = Rhythm.all
  end

end
