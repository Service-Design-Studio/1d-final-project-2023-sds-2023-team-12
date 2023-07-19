class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    # has_one_attached :avatar 

    include ImageUploader::Attachment(:image)

    validates :full_name, presence: true
    validates :age, presence: true
    validates :location, presence: true
    validates :description, presence: true
    validates :special_note, presence: true
    validates :image_data, presence: true
    validates :missing_time, presence: true

    def self.retrieve_user_id post_id
        return Post.find_by(id: post_id).user_id
    end
end
