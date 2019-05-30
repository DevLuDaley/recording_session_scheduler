class Artist < ApplicationRecord

    has_many :comments #, inverse_of: :recording_sessions
    has_many :recording_sessions #, inverse_of: :recording_sessions
    
    #adds methods to my model
    has_many :engineers, through: :recording_sessions
    has_many :studios, through: :recording_sessions
    accepts_nested_attributes_for :comments
    accepts_nested_attributes_for :recording_sessions
#    accepts_nested_attributes_for :engineers
 #   accepts_nested_attributes_for :studios

validates :name, presence: true, length: { minimum: 1 }
validates :name, uniqueness: true
#validates :email, presence: optional




  def recording_sessions_attributes=(recording_session_attributes)
    recording_session_attributes.values.each do |recording_session_attribute|
      recording_session = RecordingSession.find_or_create_by(recording_session_attribute)
      self.recording_sessions << recording_session
    end
  end
  
  
  # def engineers_attributes=(engineer_attributes)
  #   engineer_attributes.values.each do |engineer_attribute|
  #     engineer = Engineer.find_or_create_by(engineer_attribute)
  #     self.engineers << engineer
  #   end
  # end
  
  # def studios_attributes=(studio_attributes)
  #   studio_attributes.values.each do |studio_attribute|
  #     studio = Studio.find_or_create_by(studio_attribute)
  #     self.studio << studio
  #   end
  # end

end
