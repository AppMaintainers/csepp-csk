class ApplicationController < ActionController::Base
  protect_from_forgery

  def navigation
    @top_page_items = Menu.belongs_to_page.select{ |menu_item| menu_item.root? } # root pages
    @other_links = Menu.other_links # links
    @blog = {name: "Blog", url: blogs_path} if Menu.has_blog? # blogs
  end

end
