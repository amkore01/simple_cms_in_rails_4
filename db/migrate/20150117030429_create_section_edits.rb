class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
	  t.references :section
	  t.references :user
	  t.string :summary
      t.timestamps
    end
	add_index :section_edits, ["section_id","user_id"]
  end
  
  def down
	drop_table :section_edits
  end
end
