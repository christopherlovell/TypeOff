class CreateFonts < ActiveRecord::Migration
  def change
    create_table :fonts do |t|
      t.string :title
      t.string :link
      t.string :linktitle

      t.timestamps
    end
  end
end
