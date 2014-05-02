class RemoveVotesFromFonts < ActiveRecord::Migration
  def change
    remove_column :fonts, :votes, :integer
  end
end
