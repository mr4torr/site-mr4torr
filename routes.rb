def set_routes!

  pages = %w(curriculo)
  pages.each do |page|
    proxy(
      "/#{page}.html",
      "/#{page}/index.html"
    )
  end

end
