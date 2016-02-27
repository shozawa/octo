module ApplicationHelper
  def link_to_next_page(opt={})
    base_url = request.path_info
    page = params[:page].to_i || 1
    next_page = page + 1
    opt.merge!({ :rel => 'next' })
    link_to 'next', "#{base_url}?page=#{next_page}", opt
  end
end
