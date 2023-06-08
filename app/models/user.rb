class User < ApplicationRecord
  has_many :owned_realties, dependent: :destroy, class_name: "Realty", foreign_key: "user_id"
  has_many :messages, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :location_realties, through: :tenants, source: :realty
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def full_name
    return "Pas de nom" unless first_name || last_name
    "#{first_name} #{last_name}"
  end
end
