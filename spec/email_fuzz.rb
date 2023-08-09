# FUZZING TEST
# To run this, 'bundle exec rspec spec/email_fuzz.rb'

require 'rails_helper'

RSpec.describe "Email fuzzing test", type: :model do
  context "Valid email addresses" do
    it "checks if email creation works for valid emails" do
      100.times do
        # Generate a random string for the email username part (before '@')
        username = SecureRandom.hex(4)

        # Generate a random string for the domain part (after '@')
        domain = SecureRandom.hex(4)

        # Combine the username and domain with an '@' symbol in between to form the email
        email = "#{username}@#{domain}.com"

        # Pass the generated email to email creation method
        created_user = User.create(email: email, password: "123456")

        # Test if the created email is valid 
        expect(created_user).to be_valid
      end
    end
  end

  context "Invalid email addresses" do
    it "checks if email creation fails for invalid emails" do
      100.times do
        # Generate a random string without '@' symbol, which will result in an invalid email
        invalid_email = SecureRandom.hex(8) + ".com"

        # Pass the generated invalid email to email creation method
        created_user = User.create(email: invalid_email, password: "123456")

        # Test if the created email is invalid since there is no @ symbol
        expect(created_user).not_to be_valid
      end
    end
    
  end
end
