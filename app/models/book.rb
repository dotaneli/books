class Book < ActiveRecord::Base
  has_many :pages
  has_and_belongs_to_many :readers, :class_name => "User"

  validates_presence_of :name, :author, :price
end
