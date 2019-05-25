class Artist < ApplicationRecord

    has_many :recording_sessions #adds methods to my model
    has_many :engineers, through: :recording_sessions
    has_many :studios, through: :recording_sessions
    accepts_nested_attributes_for :recording_sessions
    accepts_nested_attributes_for :engineers

validates :name, presence: true, length: { minimum: 1 }
validates :name, uniqueness: true


end
