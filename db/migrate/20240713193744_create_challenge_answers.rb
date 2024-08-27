class CreateChallengeAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :challenge_answers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.text :submitted_code

      t.timestamps
    end
  end
end
