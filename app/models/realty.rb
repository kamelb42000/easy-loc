class Realty < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :claims, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  belongs_to :user

  attr_accessor :tenant_user_id, :tenant_enter_date, :tenant_out_date

  validates :name, :address, :category, :rent, presence: true

  def send_tenant_invitation
    if tenant_email.present?
      # Générer un token d'invitation pour le locataire
      token = Devise.friendly_token

      # Envoyer l'e-mail d'invitation au locataire
      SendinblueMailer.tenant_invitation(self, tenant_email, token).deliver_now
    end
  end
end
