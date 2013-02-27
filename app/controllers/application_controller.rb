class ApplicationController < ActionController::Base
  protect_from_forgery

  def navigation
    @menu_items = Menu.all.to_a
    @navigation_items = @menu_items.map{ |menu_item| {name: menu_item.name, url: menu_item.url} }
  end

end
