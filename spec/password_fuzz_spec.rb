# To run this, 'bundle exec rspec spec/password_fuzz_spec.rb'

require 'rails_helper'

RSpec.describe "Password fuzzing test", type: :model do
  context "Valid passwords" do
    it "checks if password creation works for valid passwords" do
      100.times do
        # Generate a random string for the password with a minimum length of 6 characters
        password = SecureRandom.hex(3)  # This will generate a 6-character password
        # Generate a random valid email
        username = SecureRandom.hex(4)
        domain = SecureRandom.hex(4)
        email = "#{username}@#{domain}.com"

        # Pass the generated password to your Rails project's password creation method
        created_user = User.create(email: email, password: password)

        # Test if the created user is valid (meets your Rails project's requirements)
        expect(created_user).to be_valid
      end
    end
  end


  context "Invalid passwords" do
    it "checks if password creation fails for invalid passwords" do
      100.times do
        # Generate a random string for the password with less than 6 characters
        password = SecureRandom.hex(2)  # This will generate a 4-character password
        # Generate a random valid email
        username = SecureRandom.hex(4)
        domain = SecureRandom.hex(4)
        email = "#{username}@#{domain}.com"

        # Pass the generated invalid password to your Rails project's password creation method
        created_user = User.create(email: email, password: password)

        # Test if the created user is invalid (fails to meet your Rails project's requirements)
        expect(created_user).not_to be_valid
      end
    end
  end
end