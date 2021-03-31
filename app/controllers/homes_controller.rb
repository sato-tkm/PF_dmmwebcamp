class HomesController < ApplicationController

  def top
    @movies = Movie.last(5)
    puts "slick!!!-----"
  end

end
