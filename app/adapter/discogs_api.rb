Model DiscogsAPI

  @@root_url = "https://api.discogs.com/database/search?q="
  @@discogs_key = "&key=#{ENV[:key]}&secret=#{ENV[:secret]}"

  def search_from_catalog_number(catno)
    search = HTTParty.get("#{@@root_url}/database/search?q=#{catno}#{@@discogs_key}")
    #set discogs_id to "master_id"
  end

  def search_from_barcode(barcode)
    search = HTTParty.get("#{root_@@url}/database/search?q=#{barcode}#{@@discogs_key}")
    #set discogs_id to "master_id"
  end

  def get_info(discogs_id)
    info = "#{@@root_url}/masters/#{discogs_id}"

end
