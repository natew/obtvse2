module PageTitleHelper
  def html_title(content)
    if content.present?
      [content,User.info('name')].join(' - ')
    else
      User.info('name')
    end
  end

  def page_title(content)
    @title = content || User.info('name')
    render partial: 'name'
  end

  def linked_title
    link_to User.info('name'), root_path
  end
end
