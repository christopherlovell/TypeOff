class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :title
      t.string :link
      t.string :linktitle
      t.integer :votes

      t.timestamps
    end
  end
end
