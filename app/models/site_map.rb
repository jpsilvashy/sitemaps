class SiteMap
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256
  property :title, String, length: 256

  has n, :pages
end