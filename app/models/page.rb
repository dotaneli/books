class Page < ActiveRecord::Base
  belongs_to :book

  # image_size = {:iphone_4_v => "640x960",
  #               :iphone_4_h => "960x640",
  #               :iphone_5_v => "640x1136",
  #               :iphone_5_h => "1136x640",
  #               :iphone_6_v => "1080x1920",
  #               :iphone_6_h => "1920x1080",
  #               :ipad_v => "768x1024",
  #               :ipad_h => "1024x768",
  #               :ipad_2_v => "1536x2048",
  #               :ipad_2_h => "2048x1536",
  #               :large => "600x600>",
  #               :medium => "300x300>",
  #               :thumb => "100x100>"}

  image_size = {:large => "600x600>", :medium => "300x300>", :thumb => "100x100>"}

  has_attached_file :page_image, styles: image_size,
      default_url: "/app/assets/images/:style/missing.png"
  validates_attachment_content_type :page_image, content_type: /\Aimage\/.*\Z/

  acts_as_list :scope => :book

  scope :sorted, lambda {order("pages.position ASC")}

  def next_page_id
    next_page = Page.find_by(:book_id => self.book_id, :position => (self.position+1))
    if next_page
      return next_page.id
    else
      return self.id
    end
  end

  def previous_page_id
    previous_page = Page.find_by(:book_id => self.book_id, :position => (self.position-1))
    if previous_page
      return previous_page.id
    else
      return self.id
    end
  end
end
