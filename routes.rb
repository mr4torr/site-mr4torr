def set_routes!


  proxy(
    '/index.html',
    '/views/home/index.html'
  )

  pages = %w(curriculo)
  pages.each do |page|
    proxy(
      "/#{page}.html",
      "/views/#{page}/index.html"
    )
  end
  # proxy(
  #   '/404.html',
  #   '/layouts/404.html'
  # )




    # proxy "/#{data.pagina_batalha.slug}.html", "/views/pagina_batalha.html", ignore: true, locals: { page: data.pagina_batalha }
end
