module Worker
  @queue = :sitemaps

  def self.perform(uri)
    Crawler.create_site_map_for(uri)
  end
end