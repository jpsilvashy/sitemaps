class Link
  include DataMapper::Resource

  property :id, Serial

  property :uri, URI, length: 256

  belongs_to :page

end