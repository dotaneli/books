class CreateBooks < ActiveRecord::Migration
  def up
    create_table :books do |t|
      t.string "name"
      t.string "author"
      t.decimal "price", :precision => 8, :scale => 2
      t.integer "number_of_pages"


      t.timestamps null: false
    end

    add_index(:books,:id)
    add_index(:books,:name)
  end

  def down
    drop table :books
  end
end
