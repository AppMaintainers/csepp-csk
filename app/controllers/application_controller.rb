class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_pages
  before_filter :set_hun_locale

  def load_pages
    @nav_pages = Page.all.to_a.select{|page| page.parent_id.blank?}
  end

  def set_hun_locale
  	I18n.locale = :hu
  end
end
