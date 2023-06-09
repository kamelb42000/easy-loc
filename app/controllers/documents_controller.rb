class DocumentsController < ApplicationController

  require "open-uri"
  require 'tempfile'
  require 'zip'
  include CloudinaryHelper

  def index
    @realty = Realty.find(params[:realty_id])
    @documents = @realty.documents
    @document = Document.new
    @documents = Document.all
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


  


private

  def document_params
    params.require(:document).permit(:name, :photo)
  end

end


# def download_file
# document = Document.find(params[:id])
# # Générer l'URL de la ressource souhaitée avec la

# # Télécharger la ressource
# File.open("public/#{document.name}.jpg", 'wb') do |file|
#   file.write(open(document.photo.url).read)
# end

# File.open("#{Rails.root}/public/#{document.name}.pdf", "r") do |f|
#   send_data f.read, type: "application/pdf", filename: "toto.pdf"
# end

# File.delete("#{Rails.root}/public/toto.pdf") if File.exist?("#{Rails.root}/public/toto.pdf")


# temp_file = Tempfile.new("files.zip")

# Zip::File.open(temp_file.path, Zip::File::CREATE) do |zipfile|
#   documents.each do |document|
#     file_extension = File.extname(document.photo.filename.to_s).downcase
#     file_name = "#{document.id}_#{document.photo.filename}"

#     download = URI.open(Cloudinary::Utils.cloudinary_url(document.photo.key))

#     zipfile.get_output_stream(file_name) do |file|
#       file.write(download.read.force_encoding("UTF-8"))
#     end
#   end
# end

# send_file temp_file.path, disposition: 'attachment', filename: 'files.zip'

# temp_file.close
# temp_file.unlink
