require "./environment.rb"
require "./routes.rb"

activate :livereload

# set :css_dir, "stylesheets"
# set :js_dir, "javascripts"
# set :images_dir, "images"
# set :fonts_dir, "fonts"
set :layout, "views/layouts/default.html"


# set :favicons, [
#   { rel: "apple-touch-icon-precomposed", size: "152x152", icon: "apple-touch-icon-152x152-precomposed.png" },
#   { rel: "apple-touch-icon-precomposed", size: "114x114", icon: "apple-touch-icon-114x114-precomposed.png" },
#   { rel: "apple-touch-icon-precomposed", size: "72x72", icon: "apple-touch-icon-72x72-precomposed.png" },
#   { icon: "mstile-144x144", format: :png },
#   { rel: "shortcut icon", icon: "favicon.png", size: "16x16" },
#   { rel: "icon", icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" }
# ]

# activate :external_pipeline,
#   name: :webpack,
#   command: build? ? './node_modules/webpack/bin/webpack.js --bail' : './node_modules/webpack/bin/webpack.js --watch -d',
#   source: ".tmp/dist",
#   latency: 1

configure :development do

  config[:host] = ENV['site_url_development']
end

configure :build do
  config[:host] = ENV['site_url_production']
end


activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :minify_html do |html|
  html.preserve_line_breaks = true
end

activate :gzip
activate :minify_javascript
activate :directory_indexes


# Enable cache buster
activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']


# Layouts
# https://middlemanapp.com/basics/layouts/


ready do
  set_routes!
end

# Per-page layout changes
# page '/*.xml', layout: false
# page '/*.json', layout: false
# page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
