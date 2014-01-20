class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :title, :null => false
      t.string :name, :null => false
      t.string :link, :null => false
      t.string :source, :null => false
      t.string :style, :null => false
      
      t.integer :votes
      
      t.timestamps
    end
  end
end
