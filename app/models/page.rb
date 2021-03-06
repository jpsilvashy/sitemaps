class Page
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256
  property :title, String, length: 256

  property :asset_type, String, length: 256

  belongs_to :site_map

  has n, :assets
  has n, :links

end