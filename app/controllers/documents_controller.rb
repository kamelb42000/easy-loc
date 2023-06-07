class DocumentsController < ApplicationController

  require "open-uri"
  include CloudinaryHelper

  def index
    @realty = Realty.find(params[:realty_id])
    @documents = @realty.documents
    @document = Document.new
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    @realty = Realty.find(params[:realty_id])
    @document.realty = @realty
      if @document.save
        redirect_to realty_documents_path(@realty.id), notice: "Le document a été créé avec succès."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to realty_documents_path(@document.realty), status: :see_other
  end

  def show
    @document = Document.find(params[:id])
  end

  def download_image
    @document = Document.find(params[:id])
    download = URI.open(cl_image_path(@document.photo.key))

    open(download) do |file|
      File.open("public/image.jpg", "wb") do |f|
        f.write(file.read.force_encoding("UTF-8"))
      end
    end

    path = File.join(Rails.root, "public", "image.jpg")

   send_file(path, disposition: 'attachment')
  end

  private

  def document_params
    params.require(:document).permit(:name, :photo)
  end

end
