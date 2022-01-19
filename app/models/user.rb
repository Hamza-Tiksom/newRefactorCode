class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts ,dependent: :destroy
  has_many :comments ,dependent: :destroy
  has_many :likes ,dependent: :destroy
  has_one :role

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
end
