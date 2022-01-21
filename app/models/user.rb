class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments ,dependent: :destroy
  has_many :posts ,dependent: :destroy
  has_many :likes ,dependent: :destroy

  after_create :assign_default_role

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  private

  def assign_default_role
    self.add_role :client
  end
  # def all_tags=(names)
  #   self.tags=names.split(',').map do |name|
  #     Tag.where(name: name).first_or_create!
  #   end
  # end
  #
  # def all_tags
  #   tags.map(&:name).join(",")
  # end
end
