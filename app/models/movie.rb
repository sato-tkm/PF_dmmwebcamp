class Movie < ApplicationRecord

  attachment :image

  has_many :movie_comments, dependent: :destroy
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres, dependent: :destroy

  validates :image, presence: true


  def self.search(search)
      return Movie.all unless search
      Movie.where(['name LIKE ?', "%#{search}%"])
  end

end
