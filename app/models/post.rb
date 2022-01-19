class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category

  has_many :taggings, dependent: :destroy
  has_many :comments ,dependent: :destroy
  has_many :likes ,dependent: :destroy
  has_many :tags ,through: :taggings

  validates :body, presence: true , length: {minimum: 10}
  validates :title , presence: true


  def all_tags=(names)
    self.tags=names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(",")
  end


end

