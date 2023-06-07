class ClaimsController < ApplicationController
  before_action :set_realty, only: [:index, :new, :create, :edit, :update]
  before_action :set_claim, only: [:destroy]


  def index
    @claims = @realty.claims
  end

  def show
    @claim = Claim.find(params[:id])
  end

  def new
    @claim = Claim.new
  end

  def create
    @claim = @realty.claims.build(claim_params)
    if @claim.save
      redirect_to realty_claims_path, notice: "Votre incident a été enregistrée avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @claim = Claim.find(params[:id])
  end

  def update
    @claim = Claim.find(params[:id])
    if @claim.update(claim_params)
      redirect_to realty_claims_path
    else
      render :edit
    end
  end

  def destroy
    @claim.destroy
    redirect_to realty_claims_path(@claim.realty)
  end

  private

  def set_realty
    @realty = Realty.find(params[:realty_id])
  end

  def set_claim
    @claim = Claim.find(params[:id])
  end

  def claim_params
    params.require(:claim).permit(:title, :content, :photo)
  end
end
