
class SendinblueMailer < ActionMailer::Base
  default from: "medjoubillal@gmail.com"

  def tenant_email_not_found(realty, tenant_email)
    @realty = realty
    @tenant_email = tenant_email
    mail(to: "medjoubillal@gmail.com", subject: "Alerte : Adresse e-mail du locataire non trouvée")
  end

  def tenant_invitation(realty, user)
    @realty = realty
    @user = user
    mail(to: user.email, subject: "Invitation à s'inscrire sur l'application")
  end
end
