class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save!
    genres = Vision.get_image_data(@movie.image)
    genres.each do |genre|
      @movie.genres.create(genrename: genre)
    end
    flash[:notice] = "successfully"
    redirect_to movies_path
  end

  def index
    @movies = if params[:genre_id].present?
      Movie.joins(:movie_genres).where('movie_genres.genre_id = ?', params[:genre_id])
    else
      Movie.all
    end
    @movie = MovieComment.new
  end

  def show
    @movie = Movie.find_by(id: params[:id])
    if @movie == nil
      redirect_to movies_path
    end
    @movie_comment = MovieComment.new
    @like = Like.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    redirect_to movie_path(movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  def search
    @movies = Movie.search(params[:search])
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :body, :image, genre_ids: [])
  end
end
