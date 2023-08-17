# rubocop:disable Style/ClassVars
class Song
  @@id_count = 0
  attr_reader :id

  def initialize(title:, artists:, album:, released:, id: nil)
    # @id = id ? id : @@id_count.next
    @id = id || @@id_count.next
    @@id_count = @id
    @title = title
    @artists = artists
    @album = album
    @released = released.to_i
  end

  def details
    [@id, @title, @artists.join(", "), @album, @released]
  end

  def to_json(_optional)
    { id: @id, title: @title, artists: @artists, album: @album, released: @released }.to_json
  end

  def update(title:, artists:, album:, released:)
    @title = title unless title.empty?
    @artists = artists unless artists.empty?
    @album = album unless album.empty?
    @released = released.to_i unless released.to_s.empty?
  end
end
# rubocop:enable Style/ClassVars
