class Claim < ApplicationRecord
  STATUS = ["pending", "in progress", "refused", "done"]

  belongs_to :realty
  belongs_to :tenant, class_name: "User", foreign_key: "tenant_id"

  has_one_attached :photo

  validates :title, :content, presence: true
  validates :status, inclusion: { in: STATUS }
end
