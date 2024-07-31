class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :participant, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true
      t.string :question_id
      t.string :integer
      t.string :answered
      t.string :bool

      t.timestamps
    end
  end
end
