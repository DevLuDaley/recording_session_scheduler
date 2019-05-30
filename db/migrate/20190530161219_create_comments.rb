class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :artist, index: true
      t.string :content
      t.timestamps
    end
  end
end
