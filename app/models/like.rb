class Like < ApplicationRecord
  belongs_to :movie_comment
  belongs_to :user
  validates_uniqueness_of :movie_comment_id, scope: :user_id
end
