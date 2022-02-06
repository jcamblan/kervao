# frozen_string_literal: true

require 'slim'
require 'redcarpet'

# Avoid HTML minification for people who don't know slim
Slim::Engine.default_options[:pretty] = true

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes
activate :i18n, langs: %i[en fr], mount_at_root: false
activate :dato

set :relative_links, true
redirect 'index.html', to: '/fr/index.html'

# With alternative layout
# page '/path/to/file.html', layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

dato.cottages.each do |cottage|
  proxy "/fr/#{cottage.reference}.html", 'localizable/gite.html',
        locals: { cottage: cottage },
        ignore: true,
        locale: :fr
  proxy "/en/#{cottage.reference}.html", 'localizable/gite.html',
        locals: { cottage: cottage },
        ignore: true,
        locale: :en
end

ignore '/localizable/gite.html.slim'

# Methods defined in the helpers block are available in templates
helpers do
  def markdownify(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(text)
  end
end

# Build-specific configuration
configure :build do
  activate :minify_html
end

configure :development do
  activate :livereload
end
