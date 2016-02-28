module ApplicationHelper
  def link_to_next_posts
    url = request.path_info
    page = params[:page] || 1
    next_page = page.to_i + 1
    link_to "next", "#{url}?page=#{next_page}", remote: true, rel: 'next'
  end
end
