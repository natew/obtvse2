require 'kramdown'

module ApplicationHelper
  def is_admin?
    logged_in?
  end

  def markdown(text)
    Kramdown::Document.new(youtube_embed(text)).to_html
  end

  def youtube_embed(str)
    output = str.lines.map do |line|
      match = nil
      match = line.match(/^http.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/)

      if match
        render partial: 'youtube.html', locals: { video: match[1] }
      else
        line
      end
    end
    output.join
  end
end