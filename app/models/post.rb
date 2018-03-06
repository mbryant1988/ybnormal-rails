class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
  has_attached_file :image,
  :styles => {
    :thumb => "100x100#",
    :small  => "150x150>",
    :medium => "200x200",
    :square => "300x300#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
