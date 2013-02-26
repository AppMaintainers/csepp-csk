module ApplicationHelper
  def get_title(url)
    page = Page.where(_slugs: url).to_a
    #Rails.logger.info(page['title'])
    title = page[0].title
    return title
  end
end
