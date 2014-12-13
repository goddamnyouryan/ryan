xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  site_url = 'http://www.goddamnyouryan.com/blog/'
  xml.channel do
    xml.title 'God Damn You Ryan Blog'
    xml.description 'Web Development and Travel'
    xml.link site_url

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link URI.join(site_url, article.url)
        xml.description do
          xml.cdata! article.body
        end
        if article.metadata[:page].key?('image')
          xml.image do
            xml.url article.metadata[:page]['image']
            xml.title article.title
            xml.link URI.join(site_url, article.url)
          end
        end
        xml.pubDate Time.parse(article.date.to_s).rfc822
        xml.guid URI.join(site_url, article.url)
      end
    end
  end
end
