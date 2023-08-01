class RealtiesController < ApplicationController
  def index
    @location_realties = current_user.location_realties
    @owned_realties = current_user.owned_realties
  end

  def new
    @realty = Realty.new
    @realty.tenants.build
  end

  def show
    @realty = Realty.find(params[:id])
  end

  def edit
    @realty = Realty.find(params[:id])
    unless current_user == @realty.user
      redirect_to realty_path(@realty), flash: { alert: "Vous n'êtes pas autorisé à modifier ce bien immobilier." }
    end
  end

  def update
    @realty = Realty.find(params[:id])
    unless current_user == @realty.user
    redirect_to realty_path(@realty), flash: { alert: "Vous n'êtes pas autorisé à modifier ce bien immobilier." }
      return
    end

    if @realty.save
      tenant_user = User.find_by(email: params["tenant_email"])
      unless tenant_user.present? && tenant.persisted?
        tenant_user = User.create(email: params["tenant_email"], password: "password")
        # token = Devise.friendly_token
        SendinblueMailer.tenant_invitation(@realty, tenant_user).deliver_now
      end

    Tenant.create(user: tenant_user, realty: @realty, enter_date: params[:realty][:tenant_enter_date], out_date: params[:realty][:tenant_out_date])
      redirect_to realty_path(@realty), flash: { success: "Le bien a été modifié avec succès" }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.user = current_user
    if @realty.save
      tenant_user = User.find_by(email: params["tenant_email"])
      unless tenant_user.present? && tenant.persisted?
        tenant_user = User.create(email: params["tenant_email"], password: "password")
        # token = Devise.friendly_token
        SendinblueMailer.tenant_invitation(@realty, tenant_user).deliver_now
      end

    Tenant.create(user: tenant_user, realty: @realty, enter_date: params[:realty][:tenant_enter_date], out_date: params[:realty][:tenant_out_date])

      redirect_to realty_path(@realty), flash: { success: "Le bien a été créé avec succès" }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @realty = Realty.find(params[:id])
    unless current_user == @realty.user
      redirect_to realty_path(@realty), flash: { alert: "Vous n'êtes pas autorisé à supprimer ce bien immobilier." }
      return
    end
    @realty.destroy
    redirect_to realties_path, status: :see_other
  end

  private

  def realty_params
    params.require(:realty).permit(:name, :address, :rent, :category, :payment_date, :tenant_user_id, :tenant_enter_date, :tenant_out_date, :tenant_email)
  end
end
