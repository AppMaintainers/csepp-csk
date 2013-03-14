xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Blog posts"
    xml.description "Lots of blog posts"
    xml.link blogposts_url(:rss)

    for blogpost in @blogposts
      xml.item do
        xml.title blogpost.title
        xml.description blogpost.body
        xml.pubDate blogpost.created_at.to_s(:rfc822)
        xml.link page_show_path(blogpost.slug, :rss)
        xml.guid page_show_path(blogpost.slug, :rss)
      end
    end
  end
end