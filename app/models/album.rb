class Album < ActiveRecord::Base
  validates :title, :band, :category, :year, presence: true

  belongs_to :band

end
