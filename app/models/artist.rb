class Artist < ApplicationRecord

    has_many :recording_sessions #adds methods to my model
    has_many :engineers, through: :recording_sessions
    has_many :studios, through: :recording_sessions
    accepts_nested_attributes_for :recording_sessions
    accepts_nested_attributes_for :engineers
    accepts_nested_attributes_for :studios

validates :name, presence: true, length: { minimum: 1 }
validates :name, uniqueness: true


  def recording_sessions_attributes=(recording_session_attributes)
    recording_session_attributes.values.each do |recording_session_attribute|
      recording_session = RecordingSession.find_or_create_by(recording_session_attribute)
      self.recording_sessions << recording_session
    end
  end



end
