post '/site_maps' do

  @site_map = Crawler.create_site_map_for(params['url'])

  redirect "/site_maps/#{@site_map.id}"
end

get '/site_maps/:id' do

  @site_map = SiteMap.get(params[:id].to_i)

  erb :site_map
end
