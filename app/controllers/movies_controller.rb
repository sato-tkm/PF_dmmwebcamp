class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    flash[:notice] = "successfully"
    redirect_to movies_path
  end

  def index
    @movies = Movie.all
    @movie = MovieComment.new
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_comment = MovieComment.new
    @like = Like.new
  end

  def search
    @movies = Movie.search(params[:search])
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :body, :image)
  end
end
