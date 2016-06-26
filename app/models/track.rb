class Track < ActiveRecord::Base
  validates :album, :title, :track_number, :category, presence: true

  belongs_to :album

end
