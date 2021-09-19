class AnswerColumnChange < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :content
    add_column :answers, :body, :text, null: false
  end
end
