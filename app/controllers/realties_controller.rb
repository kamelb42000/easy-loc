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
    if @realty.update(realty_params)
      tenant_email = params["tenant_email"]
      tenant_user = User.find_by(email: tenant_email)
      # enter_date = Date.parse("#{realty_params['tenant_enter_date(1i)']}-#{realty_params['tenant_enter_date(2i)']}-#{realty_params['tenant_enter_date(3i)']}")
      # out_date = Date.parse("#{realty_params['tenant_out_date(1i)']}-#{realty_params['tenant_out_date(2i)']}-#{realty_params['tenant_out_date(3i)']}")
      tenant = Tenant.find_or_create_by(user: tenant_user, realty: @realty)
      tenant.update(enter_date: params[:realty][:tenant_enter_date], out_date: params[:realty][:tenant_out_date])
      redirect_to realty_path(@realty), flash: {alert: "Le bien a été modifié avec succès"}
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.user = current_user
    if @realty.save!
      # tenant_user = User.find(realty_params[:tenant_user_id])
      tenant_email = params["tenant_email"]
      tenant_user = User.find_by(email: tenant_email)
      # enter_date = Date.parse("#{realty_params['tenant_enter_date(1i)']}-#{realty_params['tenant_enter_date(2i)']}-#{realty_params['tenant_enter_date(3i)']}")
      # out_date = Date.parse("#{realty_params['tenant_out_date(1i)']}-#{realty_params['tenant_out_date(2i)']}-#{realty_params['tenant_out_date(3i)']}")
      tenant = Tenant.find_or_create_by(user: tenant_user, realty: @realty)
      tenant.update(enter_date: params[:realty][:tenant_enter_date], out_date: params[:realty][:tenant_out_date])
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
