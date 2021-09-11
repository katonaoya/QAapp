class AddSolutionToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :solution, :boolean, default: false, null: false
  end
end
