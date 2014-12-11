module ApplicationHelper
  def technology_link(term)
    if data.technology[term].present?
      data.technology[term]
    else
      "http://lmgtfy.com/?q=#{term}"
    end
  end
end
