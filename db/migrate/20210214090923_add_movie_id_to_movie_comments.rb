class AddMovieIdToMovieComments < ActiveRecord::Migration[5.2]
  def up
    add_column :movie_comments, :movie_id, :integer
  end

  def down
    remove_column :movie_comments, :movie_id, :integer
  end
end
