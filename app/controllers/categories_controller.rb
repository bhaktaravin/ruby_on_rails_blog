class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.with_posts.includes(:posts)
  end

  def show
    @posts = @category.posts.recent.includes(:category)
  end

  private

  def set_category
    @category = Category.find_by!(slug: params[:id])
  end
end
