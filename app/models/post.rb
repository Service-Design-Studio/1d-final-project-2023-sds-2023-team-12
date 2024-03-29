
class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_one_attached :avatar

    include ImageUploader::Attachment(:image)

    validates :full_name, presence: true
    # validates :age, presence: true
    validates :age, numericality: { greater_than_or_equal_to: 0}
    validates :location, presence: true
    validates :description, presence: true
    validates :special_note, presence: true
    # validates :image_data, presence: true
    validates :missing_time, presence: true
    validates :reward, numericality: { greater_than_or_equal_to: 0}

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


    def self.with_age_filter(age_cag_list) 
        if age_cag_list.nil?
            all
        else
            joins(:user).where(posts: { age: AGE_CATEGORIES.values_at(*age_cag_list).flatten })
        end
    end

    #full text search
    def self.search(query)
        if query.present?
          where("full_name LIKE :query OR location LIKE :query OR description LIKE :query OR special_note LIKE :query", query: "%#{query}%")
        else
          all
        end
      end

    ###



    def self.shorten_description random_string,desire_len
        return " " if random_string.nil?
        if random_string.length <= 30
            return random_string
        end
        return "#{random_string.slice(0..desire_len)}..."
    end
end
