class ContactsController < ApplicationController

  def index
    @categories = Category.all
  end

end
