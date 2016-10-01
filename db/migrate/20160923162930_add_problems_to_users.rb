class AddProblemsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :problem, foreign_key: true
  end
end
