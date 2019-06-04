class EngineerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :recording_sessions
  has_many :artists, through: :recording_sessions
  has_many :studios, through: :recording_sessions
end
