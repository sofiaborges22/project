class AddProblemToBreakEvens < ActiveRecord::Migration[5.0]
  def change
    add_reference :break_evens, :problem, foreign_key: true
  end
end
