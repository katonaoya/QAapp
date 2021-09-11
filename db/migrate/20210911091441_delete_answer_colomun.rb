class DeleteAnswerColomun < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :answer
  end

  def down
    add_column :question, :answer, :text
  end
end
