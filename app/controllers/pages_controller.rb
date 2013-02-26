class PagesController < ApplicationController
  before_filter :navigation

  def show
    @page = Page.where(_slugs: params[:title]).to_a
  end

end
