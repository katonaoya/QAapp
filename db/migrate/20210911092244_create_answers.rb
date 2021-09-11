class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :answer
      t.references :user
      t.references :question

      t.timestamps
    end
    add_foreign_key :answers, :users, :questions
  end
end
