class ContactsController < ApplicationController

  def index
    @categories = Category.by_topic
  end

end
