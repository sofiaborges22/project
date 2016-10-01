class AddUserToBreakEvens < ActiveRecord::Migration[5.0]
  def change
    add_reference :break_evens, :user, foreign_key: true
  end
end
