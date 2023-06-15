class Claim < ApplicationRecord
  STATUS = ["En attente", "En cours", "Refusée", "Terminée"]

  belongs_to :realty
  belongs_to :tenant, class_name: "User", foreign_key: "tenant_id"

  has_one_attached :photo

  validates :title, :content, presence: true
  validates :status, inclusion: { in: STATUS }

  def status_label
    case status
    when "in progress"
      "En attente"
    when "En cours"
      "En cours"
    when "Refusée"
      "Refusée"
    when "Terminée"
      "Terminée"
    else
      ""
    end
  end
end
