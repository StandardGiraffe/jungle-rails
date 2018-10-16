require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    before :each do
      @user = User.new
    end

    it "is valid if it has a matching password, first name, last name, and unique email" do
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.email = "hello@whoop.com"
      @user.first_name = "bob"
      @user.last_name = "bob"

      expect(@user).to be_valid
    end

    it "is invalid if it has a password shorter than 3 characters" do
      @user.password = "b"
      @user.password_confirmation = "b"
      @user.email = "hello@whoop.com"
      @user.first_name = "bob"
      @user.last_name = "bob"

      expect(@user).to_not be_valid
    end

    it "is invalid if its password and confirmation do not match" do
      @user.password = "bob"
      @user.password_confirmation = "geoff"
      @user.email = "hello@whoop.com"
      @user.first_name = "bob"
      @user.last_name = "bob"

      expect(@user).to_not be_valid
    end

    it "is invalid if the email already exists in the database" do
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.email = "bob@bob.bob"
      @user.first_name = "bob"
      @user.last_name = "bob"

      expect(@user).to_not be_valid
    end

    it "is invalid if it's missing a first name" do
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.email = "hello@whoop.com"
      @user.first_name = nil
      @user.last_name = "bob"

      expect(@user).to_not be_valid
    end

    it "is invalid if it's missing a last name" do
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.email = "hello@whoop.com"
      @user.first_name = "bob"
      @user.last_name = nil

      expect(@user).to_not be_valid
    end

    it "is invalid if it's missing an email" do
      @user.password = "bob"
      @user.password_confirmation = "bob"
      @user.email = nil
      @user.first_name = "bob"
      @user.last_name = "bob"

      expect(@user).to_not be_valid
    end


  end
end
