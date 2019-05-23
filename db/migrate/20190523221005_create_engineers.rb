class CreateEngineers < ActiveRecord::Migration[5.2]
  def change
    create_table :engineers do |t|
     t.string :name,               null: false, default: ""
     t.string :email,              null: false, default: ""

      ## Recoverable
      t.timestamps
    end
  end
end
