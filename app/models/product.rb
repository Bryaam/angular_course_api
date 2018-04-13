class Product < ApplicationRecord
  has_attached_file :main_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :main_image, content_type: /\Aimage\/.*\z/

  before_save :set_image_url

  private

  def set_image_url
    self.image_url = self.main_image.url  
  end

end
