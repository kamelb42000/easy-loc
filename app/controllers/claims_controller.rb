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
    @claim.tenant = current_user
    if @claim.save
      redirect_to realty_claims_path, notice: "Votre demande a été enregistrée avec succès"
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

  def accept
    @claim = Claim.find(params[:id])
    @claim.update(status: "En cours")
    redirect_to claim_path(@claim), notice: "La demande a été acceptée avec succès"
  end

  def refuse
    @claim = Claim.find(params[:id])
    @claim.update(status: "Refusée")
    redirect_to claim_path(@claim), notice: "pas content"
  end

  def done
    @claim = Claim.find(params[:id])
    @claim.update(status: "Terminée")
    redirect_to claim_path(@claim), notice: "La réclamation a été marquée comme terminée avec succès."
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
