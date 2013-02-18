class Public::PageController < ApplicationController

  def show
    @page = Page.find params[:id]
  end

  def index
    @pages = Page.all
  end

end
