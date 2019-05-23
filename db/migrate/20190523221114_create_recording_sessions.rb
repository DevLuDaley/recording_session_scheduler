class CreateRecordingSessions < ActiveRecord::Migration[5.2]
   def change
    create_table :recording_sessions do |t|
      t.datetime :appointment_date
      t.boolean :status, default: 'false'
      t.integer :duration, default: 30
      t.belongs_to :studio, index: true
      t.belongs_to :engineer, index: true
      t.belongs_to :artist, index: true

      t.timestamps
    end
  end
end