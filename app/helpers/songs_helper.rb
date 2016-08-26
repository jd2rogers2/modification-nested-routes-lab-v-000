module SongsHelper

  def artist_select(song, arg2=nil)
    if song.artist.nil?
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else
      if song.title
        display_artist(song)
      else
        hidden_field_tag "song[artist_id]", song.artist_id
      end
    end
  end

  def display_artist(song)
    if !song.artist.nil?
      link_to "#{song.artist.name}", artist_path(song.artist)
    else
      # hidden_field_tag "song[artist_id]", song.artist_id
      link_to "Add Artist", edit_song_path(song)
    end
  end

end
