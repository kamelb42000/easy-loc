class RealtiesController < ApplicationController

  def index
    @realities = Realty.all
  end

  def new
    @realty = Realty.new
  end

  def show
    @realty = Realty.find(params[:id])
  end

  def edit
   @realty = Realty.find(params[:id])
  end

  def update
    @realty = Realty.find(params[:id])
    if @realty.update(realty_params)
    redirect_to realties_path(@realties), flash: {alert: "toto"}
    else
      render :edit
    end
  end

  def create
    @realty = Realty.new(realty_params)
    @realty.user_id = current_user.id
    if @realty.save
      return redirect_to realties_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @realty = realty.find(params[:id])
    @realty.destroy
    redirect_to realties_path, status: :see_other
  end
end

private

def realty_params
  params.require(:realty).permit(:name, :rent, :category, :adress,:current_user)
end
