class Comment < ApplicationRecord

  belongs_to :artist
  validates :artist_id, presence: true, length: { minimum: 1 }

  
end
