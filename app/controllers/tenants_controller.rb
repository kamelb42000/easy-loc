class TenantsController < ApplicationController
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
end
