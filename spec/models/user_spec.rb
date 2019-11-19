require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: "george@email.com", name: "George", password: "george", password_confirmation: "george") }

  describe 'Validations' do
    before(:each) do
      @user = User.new(email: "TEST@TEST.com", name: "John", password: "password", password_confirmation: "password")
      @user2 = User.new(email: "puneet@email.com", name: "Puneet", password: "apssword", password_confirmation: "apssword")
    end

    it "Validates all fields" do
      expect(@user).to be_valid
    end

    it "validates: email presence" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "validates: name presence" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "validates: password presence" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "validates: password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "checks password with password confirmation" do
      @user.password = "jungle"
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "checks password length" do
      @user.password = "rails"
      expect(@user).to_not be_valid
    end

    it "checks unique and case sensitive email" do
      user = User.create(email: "georGe@email.com", name: "Charlie", password: "pleasework", password_confirmation: "pleasework")
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "passes if spaces before and after email and uppercase" do
      user = User.create(email: "bob@email.com", name: "Bob", password: "finally", password_confirmation: "finally")
      @result = User.authenticate_with_credentials(" Bob@email.com ", "finally")
      expect(@result).to_not be_nil
    end

    it "passes if email and password are correct" do
      user = User.create(email: "bob@email.com", name: "Bob", password: "finally", password_confirmation: "finally")
      @result = User.authenticate_with_credentials("bob@email.com", "finally")
      expect(@result).to_not be_nil
    end
  end

end