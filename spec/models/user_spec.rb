# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe User do
  before { @user  = User.new(name:"Kelyn", email:"brotank@yahoo.net", password:"gosomewhere", password_confirmation:"gosomewhere")  }
  subject {@user}

  #tests that parameters exist
  it {should respond_to (:name)}
  it {should respond_to (:email)}
  it {should respond_to (:password)}
  #test that user is valid
  it {should be_valid}

  #tests that invalid parameters are not valid
  describe "When name is not given" do
    before {@user.name= ""}
    it {should_not be_valid}

  end
  describe "When email is not given" do
    before {@user.email= ""}
    it {should_not be_valid}
  end
  describe "When no password given" do
    before {@user.password= nil}
    it {should_not be_valid}
  end
  describe "When no passwordConfirmation given" do
    before {@user.password_confirmation=""}
    it {should_not be_valid}
  end
  describe "When password and passwordConfirmstion are not the same" do
    before {@user.password=(@user.password_confirmation+"1")}
    it {should_not be_valid}
  end

end
