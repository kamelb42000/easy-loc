class Realty < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  belongs_to :user

  attr_accessor :tenant_user_id, :tenant_enter_date, :tenant_out_date

  validates :name, :address, :category, :rent, presence: true
end
