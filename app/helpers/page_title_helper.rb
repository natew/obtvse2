module PageTitleHelper
  def html_title(content)
    if content.present?
      [content,INFO['name']].join(' - ').html_safe
    else
      INFO['name'].html_safe
    end
  end

  def page_title(content)
    @title = content || INFO['name'].html_safe
    render partial: 'name'.html_safe
  end

  def linked_title
    link_to INFO['name'].html_safe, root_path
  end
end
