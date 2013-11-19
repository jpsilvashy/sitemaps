post '/site_maps' do

  @site_map = SiteMap.create({ uri: params['url'] })

  Crawler.create_site_map_for(@site_map.uri)

  redirect "/site_maps/#{@site_map.id}"

end

get '/site_maps/:id' do

  @site_map = SiteMap.get(params[:id].to_i)

  # @uris = []

  # @results = Crawler.run_crawler(@site_map.uri) do |page, uri|
  #   puts page.class
  #   puts uri.class

  #   @uris << uri
  # end

  erb :site_map

end
