class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :comments
  has_many :recording_sessions
  has_many :studios, through: :recording_sessions
  has_many :engineers, through: :recording_sessions
end
