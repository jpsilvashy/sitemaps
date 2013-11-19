post '/site_maps' do

  @site_map = SiteMap.first_or_create({ uri: params['url'] })

  puts "@site_map --------------"
  puts @site_map

  redirect "/site_maps/#{@site_map.id}"

end

get '/site_maps/:id' do

  @site_map = SiteMap.get(params[:id])

  erb :site_map, :locals => { :site_map => @site_map }

end
