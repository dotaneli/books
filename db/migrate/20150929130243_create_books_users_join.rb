class CreateBooksUsersJoin < ActiveRecord::Migration

  def up
    create_table :books_users, :id => false do |t|
      t.integer "book_id"
      t.integer "user_id"
    end
    add_index :books_users, ["book_id", "user_id"]
  end

  def down
    drop_table :books_users
  end
end
