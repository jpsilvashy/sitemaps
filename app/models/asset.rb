class Asset
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256

  property :asset_type, String, length: 256

  belongs_to :page
end