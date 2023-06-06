class User < ApplicationRecord
  has_many :realities, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :tenants, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
