class Page
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256

  # property :ip_address, IPAddress
  # property :created_at, DateTime

  belongs_to :site_map

end