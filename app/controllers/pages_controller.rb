class PagesController < ApplicationController
  before_filter :navigation

  def show
    @content = params[:title].blank? ? Page.first : Content.find(params[:title])
  end

  def index
    @blogposts = BlogPost.paginate(:page => params[:page], :per_page => 5)
  end

end
