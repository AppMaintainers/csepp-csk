class ApplicationController < ActionController::Base
  protect_from_forgery

  def navigation
    menus = Menu.all.to_a
    @navigation = menus.map do | item |
      item.url
    end
  end
end
