module Crawler

  require 'set'
  require 'uri'
  require 'nokogiri'
  require 'open-uri'

  def self.run_crawler( start_page, &page )

    start_uri = URI.parse(start_page)

    # These are the pages we've already visited
    crawled_pages = Set.new

    # assets
    assets = %w[ jpeg jpg gif js css png ]

    crawl_uri = ->(page_uri) do
      unless crawled_pages.include?(page_uri)

        # inster into set so we don't crawl it again
        crawled_pages << page_uri

        begin

          # Get the HTML with nokogiri
          html = Nokogiri.HTML(open(page_uri))

          # Yield html and page_uri into the block
          page.call(html, page_uri)

          # Find all the links on the page
          links = doc.css('a[href]').map{ |a| a['href'] }

          # Make these URIs, make into array, throw out ones that URI doesn't understand
          uris = links.map{ |href| URI.join( page_uri, href ) rescue nil }.compact

          # TODO: store links to external sites except facebook and instagram
          # only select links that have the same hostname
          uris.select!{ |uri| uri.host == start_uri.host }

          # collect assets
          collected_assets = uris.select{ |uri| assets.any?{ |extension| uri.path.end_with?(".#{extension}") } }

          # ignore page fragment links
          uris.each{ |uri| uri.fragment = nil }

          # Crawl all the uris
          uris.each{ |uri| crawl_uri.call(uri) }

        rescue OpenURI::HTTPError
          warn "Skipping invalid link #{page_uri}"
        end

      end
    end

    # start the crawler
    crawl_uri.call( start_uri )
  end

end