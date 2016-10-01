class AddUserToCrossover < ActiveRecord::Migration[5.0]
  def change
    add_reference :crossovers, :user, foreign_key: true
  end
end
