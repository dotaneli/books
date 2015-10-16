class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
    	t.integer "book_id"
    	t.integer "position"

      t.timestamps null: false
    end

    add_index(:pages, :book_id)
  end

  def down
    drop table :pages
  end
end
