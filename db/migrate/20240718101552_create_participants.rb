class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.datetime :email

      t.timestamps
    end
  end
end
