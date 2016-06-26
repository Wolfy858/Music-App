class Note < ActiveRecord::Base

  validates :author, :track, :content, presence: true

  belongs_to :author, class_name: "User"
  belongs_to :track

end
