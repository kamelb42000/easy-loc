class ClaimsController < ApplicationController
  before_action :set_realty, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_claim, only: [:edit, :update, :destroy]

  def index
    @realty = Realty.find(params[:realty_id])
    @claims = @realty.claims

  end

  def new
    @claim = Claim.new
  end

  def create
    @claim = @realty.claims.build(claim_params)
    if @claim.save
      redirect_to @realty
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @claim.update(claim_params)
      redirect_to @realty
    else
      render :edit
    end
  end

  def destroy
    @claim.destroy
    redirect_to @realty
  end

  private

  def set_realty
    @realty = Realty.find(params[:realty_id])
  end

  def set_claim
    @claim = Claim.find(params[:id])
  end

  def claim_params
    params.require(:claim).permit(:title, :content)
  end
end
