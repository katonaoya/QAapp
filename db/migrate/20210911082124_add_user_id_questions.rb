class AddUserIdQuestions < ActiveRecord::Migration[5.2]
  def up
    add_reference :questions, :user, null: false, index: true
  end

  def down
    remove_reference :questions, :user, index:true
  end
end
