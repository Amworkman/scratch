class Record < ActiveRecord::Base
  has_many :artist_records
  has_many :label_records
  has_many :genres
  has_many :user_records
  has_many :artists, through: :artist_records
  has_many :labels, through: :label_records
  has_many :users, through: :user_records
  has_many :tracks
  has_many :identifiers
  has_many :videos
end

def create_record

  discogs = DiscogsAPI.new

    if @new_record = Record.find_by_id(params[:id])
      @new_record    

    else
      @all_info = discogs.get_info(params[:id])
      @image_info = discogs.get_images(params[:id])
        @new_record = Record.find_or_create_by(
          id: @all_info["id"],
          title: @all_info["title"],
          thumb: Array(@image_info["results"])[0]["thumb"],
          release_date: @all_info["released"],
          lowest_price: @all_info["lowest_price"],
          num_for_sale: @all_info["num_for_sale"],
          image_url: @image_info["results"][0]["cover_image"]
        )

        Array(@all_info["artists"]).each do |artist_info| 
          @a = Artist.find_or_create_by(name: artist_info["name"], id: artist_info["id"])
          if @new_record.tracks.exclude?(@a)
          @new_record.artists << @a          
        end
      end
       
        Array(@all_info["labels"]).each do |label_info| 
          @l = Label.find_or_create_by(
            name: label_info["name"],
            id: label_info["id"]
          )
          if @new_record.tracks.exclude?(@l)
          @new_record.labels << @l          
        end
      end

        Array(@all_info["identifiers"]).each do |identifier_info| 
          @i = Identifier.create(
            type_of_info: identifier_info["type"],
            value: identifier_info["value"],
            description: identifier_info["description"]
          )
          if @new_record.tracks.exclude?(@i)
            @new_record.identifiers << @i
          end
        end
          
        Array(@all_info["videos"]).each do |video_info|
          @v = Video.create(
            uri: video_info["uri"],
            title: video_info["title"],
            description: video_info["description"],
            duration: video_info["duration"],
            embeded: video_info["embeded"]
          )
          if @new_record.tracks.exclude?(@v)
            @new_record.videos << @v
          end
        end

        Array(@all_info["tracklist"]).each do |track_info|
          @t = Track.create(
            title: track_info["title"],
            duration: track_info["duration"]
          )
          if @new_record.tracks.exclude?(@t)
          @new_record.tracks << @t
        end
      end

        Array(@all_info["genres"]).each do |genre_info|
          @g = Genre.new(style: genre_info)
          if @new_record.tracks.exclude?(@g)
          @new_record.genres << @g
        end
      end
    end
  end

  def update_record
    discogs = DiscogsAPI.new
    @all_info = discogs.get_info(params["record_id"])
    @image_info = discogs.get_images(params["record_id"])
    @record = Record.find(params["record_id"])
    @record.update(lowest_price: @all_info["lowest_price"])
    @record.update(num_for_sale: @all_info["num_for_sale"])
    @record.update(image_url: @image_info["results"][0]["cover_image"])
    @record.update(release_date: @all_info["released"])
    @record.update(thumb: @image_info["results"][0]["thumb"])
    @record.update(title: @all_info["title"])
  end
