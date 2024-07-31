class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :state
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
