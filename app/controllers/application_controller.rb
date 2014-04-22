class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_pages

  def load_pages
    @nav_pages = Page.all.to_a.select{|page| page.parent_id.blank?}
  end
end
