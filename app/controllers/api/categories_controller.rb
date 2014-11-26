class Api::CategoriesController < ApplicationController

  def index
    render json: Category.includes(:contacts)
  end

  def show
    respond_with category
  end

  def create
    respond_with :api, Category.create(category_params)
  end

  def update
    respond_with category.update(category_params)
  end

  def destroy
    respond_with category.destroy
  end

  private

    def category
      Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :urls)
    end

end
