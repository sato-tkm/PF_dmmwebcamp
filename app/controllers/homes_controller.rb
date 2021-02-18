class HomesController < ApplicationController

  def top
    @movies = Movie.all
  end

end
