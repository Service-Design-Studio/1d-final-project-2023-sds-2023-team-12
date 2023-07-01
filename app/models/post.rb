class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
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

    ##### FOR SEARCH FILTER #####

    AGE_CATEGORIES = {
        children: (0..12),
        youth: (13..20),
        adult: (21..50),
        senior: (51..)
      }.freeze

    def self.all_age_cag
        distinct.pluck(:AGE_CATEGORIES)
    end

    def age_category
        AGE_CATEGORIES.find { |_, range| range.cover?(age) }&.first
    end


    def self.with_age_filter(age_cag_list) ##todo: to define age_cag_list in view later
        if age_cag_list.nil?
            all
        else
            joins(:user).where(posts: { age: AGE_CATEGORIES.values_at(*age_cag_list).flatten })
        end
    end

    ##### FOR SEARCH FILTER #####
end
