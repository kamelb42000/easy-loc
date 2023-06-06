class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document, flash: { success: "Le document a été créé avec succès." }
    else
      render :new
    end
  end
end
