class User < ApplicationRecord
  validates :name, :presence => true, :uniqueness => true, length: { maximum: 16 }, format: { with: /\A[A-Za-z0-9]+\z/i }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
end
