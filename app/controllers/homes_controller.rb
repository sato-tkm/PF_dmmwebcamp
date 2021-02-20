class HomesController < ApplicationController

  def top
    @movies = Movie.all
    puts "slick!!!-----"
  end

end
