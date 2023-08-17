require_relative "song"

# rubocop:disable Style/ClassVars
class Playlist
  @@id_count = 0
  attr_reader :id, :songs, :name

  def initialize(name:, description:, songs: [], id: nil)
    # @id = id ? id : @@id_count.next
    @id = id || @@id_count.next
    @@id_count = @id
    @name = name
    @description = description
    @songs = songs.map { |song_data| Song.new(**song_data) }
  end

  def details
    # [1, "Salsa", "Salsa latina para el mundo", "3 Songs"]
    [@id, @name, @description, "#{@songs.size} Songs"]
  end

  def to_json(_optional)
    { id: @id, name: @name, description: @description, songs: @songs }.to_json
  end

  def update(name:, description:)
    @name = name unless name.empty?
    @description = description unless description.empty?
  end
end
# rubocop:enable Style/ClassVars
