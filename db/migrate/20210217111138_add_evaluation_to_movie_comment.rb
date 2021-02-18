class AddEvaluationToMovieComment < ActiveRecord::Migration[5.2]
  def change
    add_column :movie_comments, :evaluation, :float
  end
end
