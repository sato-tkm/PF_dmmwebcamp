class Movie < ApplicationRecord

  attachment :image

  has_many :movie_comments, dependent: :destroy

end
