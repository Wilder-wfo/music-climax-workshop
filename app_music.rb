require "json"
require "terminal-table"
require_relative "playlist"
require_relative "store"

class AppMusic
  def initialize
    @store = Store.new("store.json")
  end

  def start
    action = ""
    until action == "exit"
      print_table(list: @store.playlists,
                  title: "Music CLImax",
                  headings: ["ID", "List", "Description", "#Songs"])
      options = ["create", "show ID", "update ID", "delete ID", "exit"]
      action, id = menu(options)
      case action
      when "create" then create_playlist
      when "show" then show_playlist(id)
      when "update" then update_playlist(id)
      when "delete" then delete_playlist(id)
      when "exit" then puts "Goodbye!"
      else
        puts "Invalid action"
      end
    end
  end

  private

  def print_table(list:, title:, headings:)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = list.map(&:details)
    puts table
  end

  def menu(options)
    puts options.join(" | ")
    print "> "
    action, id = gets.chomp.split # "show 1" ["show","1"]
    [action, id.to_i]
  end

  def playlist_form
    print "Name: "
    name = gets.chomp
    print "Description: "
    description = gets.chomp
    { name: name, description: description }
  end

  def create_playlist
    playlist_hash = playlist_form
    new_playlist = Playlist.new(**playlist_hash)
    @store.add_playlist(new_playlist)
  end

  def update_playlist(id)
    playlist_hash = playlist_form
    @store.update_playlist(id, playlist_hash)
  end

  def delete_playlist(id)
    @store.delete_playlist(id)
  end

  def song_form
    print "Title: "
    title = gets.chomp
    print "Artists: "
    artists = gets.chomp.split(", ").map(&:strip)
    print "Album: "
    album = gets.chomp
    print "Released: "
    released = gets.chomp
    { title: title, artists: artists, album: album, released: released }
  end

  def create_song(playlist)
    song_hash = song_form
    new_song = Song.new(**song_hash)
    @store.add_song(new_song, playlist.id)
  end

  def update_song(id, playlist)
    song_hash = song_form
    @store.update_song(id, song_hash, playlist.id)
  end

  def delete_song(id, playlist)
    @store.delete_song(id, playlist.id)
  end

  def show_playlist(id)
    playlist = @store.find_playlist(id)
    action = ""
    until action == "back"
      print_table(list: playlist.songs,
                  title: playlist.name,
                  headings: %w[ID Title Artists Album Released])
      options = ["create", "update ID", "delete ID", "back"]
      action, id = menu(options)
      case action
      when "create" then create_song(playlist)
      when "update" then update_song(id, playlist)
      when "delete" then delete_song(id, playlist)
      when "back" then next
      else
        puts "Invalid option"
      end
    end
  end
end
