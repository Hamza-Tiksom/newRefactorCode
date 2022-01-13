class Post < ApplicationRecord
  belongs_to :user
  has_one :admin_user
  has_many :comments ,dependent: :destroy
  has_many :likes
  belongs_to :category
  validates :title , presence: true
  validates :body, presence: true , length: {minimum: 10}
end

