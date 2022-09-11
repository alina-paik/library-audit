# frozen_string_literal: true

class CategoriesController < ApplicationController
  # GET /categories?page=:page
  def index
    @categories = Category.page(params[:page])
    render json: @categories
  end
end
