class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  default_scope -> {order(created_at: :desc)}
  validates :content,presence: true, length:{maximum:140}
  mount_uploader :picture, PictureUploader
  validate  :picture_size
   private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
