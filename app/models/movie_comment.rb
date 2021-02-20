class MovieComment < ApplicationRecord

  belongs_to :user
  belongs_to :movie

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

end
