require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'associations' do
    it { should have_many(:comments) }
    it { should belong_to(:user) }
    it { should have_one_attached(:avatar) }
  end

  describe 'validations' do
    it { should validate_presence_of(:full_name) }
    it { should validate_numericality_of(:age).is_greater_than_or_equal_to(0) } 
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:special_note) }
    it { should validate_presence_of(:missing_time) }
    it { should validate_numericality_of(:reward).is_greater_than_or_equal_to(0) } 
  end
end