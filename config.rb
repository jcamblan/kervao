require 'slim'

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
activate :i18n, :mount_at_root => :fr


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

# Methods defined in the helpers block are available in templates
helpers do
  def some_helper
    'Helping'
  end
  def local_path(path, options={})
    lang = options[:language] ? options[:language] : I18n.locale.to_s
    if lang == "fr"
    	"/#{path}"
    else
      "/#{lang}/#{path}"
    end
  end
end

# Build-specific configuration
configure :build do
  set :http_prefix, '/_kervao'
end
