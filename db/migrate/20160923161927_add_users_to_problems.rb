class AddUsersToProblems < ActiveRecord::Migration[5.0]
  def change
    add_reference :problems, :user, foreign_key: true
  end
end
