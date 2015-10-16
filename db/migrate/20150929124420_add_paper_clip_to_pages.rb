class AddPaperClipToPages < ActiveRecord::Migration
  def up
    add_attachment :pages, :page_image
  end

  def down
    remove_attachment :pages, :page_image
  end
end
