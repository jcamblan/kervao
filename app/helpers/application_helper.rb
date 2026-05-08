module ApplicationHelper
  MARKDOWN = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML.new(hard_wrap: true, safe_links_only: true),
    autolink: true, tables: true, no_intra_emphasis: true
  )

  def markdown(text)
    return "" if text.blank?
    MARKDOWN.render(text).html_safe
  end
end
