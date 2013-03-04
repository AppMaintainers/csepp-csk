class PagesController < ApplicationController
  before_filter :navigation

  def show
    @content = params[:title].blank? ? Page.first : Content.find(params[:title])
  end

  def index
    @blogs = Blog.all.to_a
  end

end
