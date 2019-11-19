require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user1 = User.new(email: "TEST@TEST.com", name: "Puneet", password: "password", password_confirmation: "password")
    end
    it "Validates all fields" do
      expect(@user1).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end