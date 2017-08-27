class Post < ApplicationRecord
 belongs_to :user
 validates :image, presence: true
 validates :user_id, presence: true
 has_attached_file :image, styles: { :medium => "640x" }
 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def self.reverse_order
    all.reverse
  end

  def posted_at
    created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

  def user_name
    "#{user.user_name}"
  end
end
