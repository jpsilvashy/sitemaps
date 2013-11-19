class SiteMap
  include DataMapper::Resource

  property :id, Serial

  property :hostname, String, length: 256
  property :title, String, length: 256

  has n, :pages
  has n, :site_pages
end