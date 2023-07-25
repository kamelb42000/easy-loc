class CandidaturesController < ApplicationController
  def index
    @candidatures = Candidature.all
  end

  def show
    @candidature = Candidature.find(params[:id])
  end

  def new
    @realty = Realty.find(params[:realty_id])
    @candidature = Candidature.new

  end

  def create
    @realty = Realty.find(params[:realty_id])
    @candidature = current_user.candidatures.build(candidature_params)
    @candidature.realty = @realty

    if @candidature.save
      redirect_to @realty, notice: "Votre candidature a été soumise avec succès."
    else
      render :new
    end
  end

  def edit
    @candidature = Candidature.find(params[:id])
  end

  def update
    @candidature = Candidature.find(params[:id])
    if @candidature.update(candidature_params)
      redirect_to @candidature, notice: 'Candidature mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @candidature = Candidature.find(params[:id])
    @candidature.destroy
    redirect_to candidatures_url, notice: 'Candidature supprimée avec succès.'
  end

  private

  def candidature_params
    params.require(:candidature).permit(:title, :status, :realty_id, documents: [])
  end
end
