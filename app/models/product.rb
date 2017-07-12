class Product < ApplicationRecord
  belongs_to :user
  mount_uploaders :photos, AvatarUploader
  serialize :photos, Array
  has_many :purchases, :dependent => :destroy

  scope :category, -> (category) { where("category LIKE ?", "#{category}%") }
  scope :product_name, -> (product_name) { where("product_name LIKE ?", "#{product_name}%") }



end
