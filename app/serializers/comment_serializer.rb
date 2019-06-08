class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :artist_id
  belongs_to  :artist
end
