require "./environment.rb"
require "./routes.rb"

activate :livereload

set :css_dir, "assets/stylesheets"
set :js_dir, "assets/javascripts"
set :images_dir, "assets/images"
set :fonts_dir, "assets/fonts"

set :layout, "layouts/default.html"

configure :development do
  config[:host] = ENV['site_url_development']
end

configure :build do
  config[:host] = ENV['site_url_production']
end

activate :gzip
# activate :minify_javascript
activate :directory_indexes
activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif', '.js']

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :minify_html do |html|
  html.preserve_line_breaks = true
end

ready do
  set_routes!
end
