###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

 ###
# Blog settings
###

# Time.zone = "UTC"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = 'blog'

  blog.permalink = "{title}.html"
  blog.sources = "articles/{title}.html"
  # Matcher for blog source files
  # blog.taglink = "tags/{tag}.html"
  blog.layout = 'blog'
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 20
  # blog.page_link = "page/{num}"
end
page '/feed.xml', layout: false

activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

activate :dotenv

# Activate `middleman sync`
activate :sync do |sync|
  sync.fog_provider = 'AWS'
  sync.fog_directory = ENV['S3_BUCKET']
  sync.fog_region = 'us-east-1'
  sync.aws_access_key_id = ENV['S3_ACCESS_KEY']
  sync.aws_secret_access_key = ENV['S3_SECRET_KEY']
  sync.existing_remote_files = 'delete'
  sync.gzip_compression = true
end

# enable `middleman invalidate`
activate :cloudfront do |cf|
  cf.access_key_id = ENV['S3_ACCESS_KEY']
  cf.secret_access_key = ENV['S3_SECRET_KEY']
  cf.distribution_id = ENV['CLOUDFRONT_ID']
end

###
# Gem
###
require 'slim'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
