class DiscogsAPI
  
  @@root_url = "https://api.discogs.com"
  @@discogs_key = ENV["dk"]
  

  def search_from_catalog_number(catno)
    search = HTTParty.get("#{@@root_url}/database/search?q=#{catno}#{@@discogs_key}&per_page=100")
    search["results"]
  end

  def get_info(discogs_id)
    info = HTTParty.get"#{@@root_url}/releases/#{discogs_id}"
  end

  def get_images(discogs_id)
    info = HTTParty.get"#{@@root_url}/database/search?release_id=#{discogs_id}#{@@discogs_key}"
  end

end
