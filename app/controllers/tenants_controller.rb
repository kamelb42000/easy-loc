class TenantsController < ApplicationController
  before_action :set_realty
  before_action :set_tenant, only: [:edit, :update]

  def index
    @tenants = @realty.tenants
  end

  def show
    @tenant = @realty.tenants
  end

  def new
    @tenant = @realty.tenants.build
  end

  def create
    @tenant = @realty.tenants.build(tenant_params)

    if @tenant.save
      redirect_to realty_tenant_path(@realty, @tenant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tenant.update(tenant_params)
      redirect_to realty_tenant_path(@realty, @tenant)
    else
      render :edit
    end
  end

  private

  def set_realty
    @realty = Realty.find(params[:realty_id])
  end

  def set_tenant
    @tenant = @realty.tenants.find(params[:id])
  end

  def tenant_params
    params.require(:tenant).permit(:enter_date, :out_date, :user_id)
  end
end
