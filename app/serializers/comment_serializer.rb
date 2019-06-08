class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :artist_id, :created_at
  belongs_to  :artist
end
