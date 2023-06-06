class Realty < ApplicationRecord
has_many :messages, dependent: :destroy
has_many :claims, dependent: :destroy
has_many :documents, dependent: :destroy
has_many :tenants, dependent: :destroy
belongs_to :user

# validates :name, :address, :category, :rent, presence: true
end
