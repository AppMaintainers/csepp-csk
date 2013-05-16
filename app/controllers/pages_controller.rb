class PagesController < ApplicationController
  def show
    @content = params[:title].blank? ? Page.first : find_page_or_blog_post(params[:title])
  end

  def index
    @blogposts = BlogPost.paginate(:page => params[:page], :per_page => 5)
  end

  def find_page_or_blog_post(slug)
    begin
      content = Page.find(slug)
    rescue Mongoid::Errors::DocumentNotFound
    end
    content ||= BlogPost.find(slug)
  end
end

