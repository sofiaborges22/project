class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
      t.string :title

      t.timestamps
    end
  end
end
