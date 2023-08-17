require "json"
require_relative "playlist"

class Store
  attr_reader :playlists

  def initialize(filename)
    @filename = filename
    @playlists = load_playlist
  end

  def add_playlist(new_playlist)
    @playlists << new_playlist
    save
  end

  def update_playlist(id, data)
    playlist_found = find_playlist(id)
    playlist_found.update(**data)
    save
  end

  def delete_playlist(id)
    playlist_found = find_playlist(id)
    @playlists.delete(playlist_found)
    save
  end

  def find_playlist(id)
    @playlists.find { |playlist| playlist.id == id }
  end

  def add_song(new_song, id)
    playlist = find_playlist(id)
    playlist.songs.push(new_song)
    save
  end

  def update_song(id, new_data, playlist_id)
    playlist = find_playlist(playlist_id)
    song = find_song(id, playlist)
    song.update(**new_data)
    save
  end

  def delete_song(id, playlist_id)
    playlist = find_playlist(playlist_id)
    playlist.songs.delete_if { |song| song.id == id }
    save
  end

  def find_song(id, playlist)
    playlist.songs.find { |song| song.id == id }
  end

  private

  def load_playlist
    data = JSON.parse(File.read(@filename), { symbolize_names: true })
    data.map { |playlist_hash| Playlist.new(**playlist_hash) }
  end

  def save
    File.write(@filename, @playlists.to_json)
  end
end
