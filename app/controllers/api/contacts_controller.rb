class Api::ContactsController < ApplicationController
  respond_to :json

  def index
    respond_with Contact.all
  end

  def show
    respond_with contact
  end

  def create
    respond_with :api, Contact.create(contact_params)
  end

  def update
    respond_with contact.update(contact_params)
  end

  def destroy
    respond_with contact.destroy
  end

  private

    def contact
      Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :urls, :phones, :address)
    end

end
