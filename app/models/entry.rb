class Entry < ApplicationRecord
  belongs_to :user
  has_many :comments, :dependent => :destroy
  default_scope -> {order(created_at: :desc)}
  validates :content,presence: true, length:{maximum:140}
end
