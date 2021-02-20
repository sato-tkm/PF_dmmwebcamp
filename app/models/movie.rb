class Movie < ApplicationRecord

  attachment :image

  has_many :movie_comments, dependent: :destroy

  def self.search(search)
      return Movie.all unless search
      Movie.where(['name LIKE ?', "%#{search}%"])
  end

end
