require 'spec_helper'

describe User do
  before { @user  = User.new (name: "Kelyn" ,  email: "brotank@yahoo.net" , password: "gosomewhere" , passwordConfirm: "gosomewhere" )
  }
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
    before {@user.password=""}
    it {should_not be_valid}
  end
end
