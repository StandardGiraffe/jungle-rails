require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    before :each do
      @user = User.new
      @bob = User.create(email: "bob@bob.bob", password: "bob", password_confirmation: "bob", first_name: "bob", last_name: "bob")
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
      @user.email = "bob@BOB.bob"
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

  describe ".authenticate_with_credentials" do

    before :each do
      @user = User.new
      @bob = User.create(email: "bob@bob.bob", password: "bob", password_confirmation: "bob", first_name: "bob", last_name: "bob")
    end

    it "passes with a valid username and password" do
      user = User.authenticate_with_credentials("bob@bob.bob", "bob")
      expect(user).to be_truthy
    end

    it "fails with a vaild username and no password" do
      user = User.authenticate_with_credentials("bob@bob.bob", "")
      expect(user).to_not be_truthy
    end

    it "fails with a vaild username and the wrong password" do
      user = User.authenticate_with_credentials("bob@bob.bob", "geoff")
      expect(user).to_not be_truthy
    end

    it "passes with a valid username and matching password if the username has spaces before or after the email" do
      user = User.authenticate_with_credentials(" bob@bob.bob   ", "bob")
      expect(user).to be_truthy
    end

    it "passes with the right username, case-insensitive" do
      user = User.authenticate_with_credentials("bob@BOB.bob", "bob")
      expect(user).to be_truthy
    end


  end

end
