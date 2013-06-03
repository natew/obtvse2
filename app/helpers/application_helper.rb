require 'kramdown'

module ApplicationHelper
  def is_admin?
    logged_in?
  end

  def markdown(text)
    Kramdown::Document.new(youtube_embed(text), {
      enable_coderay: true,
      coderay_default_lang: :ruby,
      coderay_wrap: :div,
      coderay_line_numbers: :table,
      coderay_line_numbers_start: 1,
      coderay_tab_width: 2,
      coderay_css: :style,
      coderay_bold_every: 10000
    }).to_html.html_safe
  end

  def youtube_embed(str)
    output = str.lines.map do |line|
      match = nil
      match = line.match(/^http.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*$/)

      if match
        render partial: 'youtube.html', locals: { video: match[1] }
      else
        line
      end
    end
    output.join
  end
end