class Post < ApplicationRecord
    belongs_to :user
    include ImageUploader::Attachment(:image)

    validates :full_name, presence: true
    validates :age, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :special_note, presence: true
    validates :image_data, presence: true

end
