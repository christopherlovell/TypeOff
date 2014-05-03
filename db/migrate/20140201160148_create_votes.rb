class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :winner
      t.integer :loser

      t.timestamps
    end
  end
end
