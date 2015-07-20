class CompetenciesController < ApplicationController

  def index
    @competencies = Competency.all
  end

end
