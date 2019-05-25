class RecordingSession < ApplicationRecord

  belongs_to :engineer
  belongs_to :artist
  belongs_to :studio
  accepts_nested_attributes_for :artist


#scope :by_status, -> status  { where(status: status) if status.present? }
#scope :recent, -> { order("recording_sessions.updated_at DESC") }

scope :incomplete, -> { where(status: false)}
#scope :recent, -> { order("recording_sessions.updated_at DESC") }
# scope :appointment_date, -> { where(appointment_date: true) }
# scope :recent, -> { order("recording_sessions.appointment_date DESC") }


validates :engineer_id, presence: true, length: { minimum: 1 }
validates :artist_id, presence: true, length: { minimum: 1 }
validates :studio_id, presence: true, length: { minimum: 1 }

#use the validation below to ensure that an appointment/session date is entered
#validates :appointment_date, presence: true, length: { minimum: 1 }
#validates :appointment_date, uniqueness: true

STATUS = {
        :incomplete => 0,
        :complete => 1
    }
    #use hash above to set up key 10:00 v3
    #clearly define meaning of #0 || #1 in context


    
    def complete?
        self.status == STATUS[:complete]    
        #self.status == 1
    end

    def incomplete?
        self.status == STATUS[:incomplete]
        #self.status == 0
    end

    def complete!
        self.status = STATUS[:complete]
        self.save
        #self.status == 0
    end

    def incomplete!
        self.status = STATUS[:incomplete]
        self.save
        #self.status == 0
    end

def self.recent
    order("recording_sessions.updated_at DESC")
  end


def artist_name=(name)
self.artist = Artist.find_by(name: name)
end

#def self.incomplete
 #   where(complete: false)
    
#end


end
