class Track < ActiveRecord::Base
  validates :album, :title, :track_number, :category, presence: true

  belongs_to :album
  has_many :notes


  def ugly_lyrics(lyrics)

  end

end
