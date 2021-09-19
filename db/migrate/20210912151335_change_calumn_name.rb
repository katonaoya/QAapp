class ChangeCalumnName < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :question
    remove_column :answers, :answer
    add_column :questions, :content, :text
    add_column :answers, :content, :text
  end
end
