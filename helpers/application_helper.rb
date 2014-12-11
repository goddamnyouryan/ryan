module ApplicationHelper
  def technology_link(term)
    if data.technology[term].present?
      data.technology[term]
    else
      "https://www.google.com/search?q=#{term}"
    end
  end
end
