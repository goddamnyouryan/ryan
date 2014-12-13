module ApplicationHelper
  def technology_link(term)
    if data.technology[term].present?
      data.technology[term]
    else
      "https://www.google.com/search?q=#{term}"
    end
  end

  def blog_lightness
    if current_article.metadata[:page]['light']
      'light'
    else
      'dark'
    end
  end

  def next_article
    blog.articles.select {|article| article.date > current_article.date }.last
  end

  def previous_article
    blog.articles.select {|article| article.date < current_article.date }.first
  end
end
