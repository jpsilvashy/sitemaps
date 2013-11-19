class SiteMap
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256
  property :hostname, String, length: 256
  property :title, String, length: 256

  has n, :pages
  has n, :site_pages
end