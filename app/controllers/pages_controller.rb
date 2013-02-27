class PagesController < ApplicationController
  before_filter :navigation

  def show
    @page = params[:title].blank? ? Page.first : Page.find(params[:title])
  end

end
