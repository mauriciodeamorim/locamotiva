require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :email => "email@email.com",
      :crypted_password => "password",
      :password_salt => "password",
      :persistence_token => "value for persistence_token"
    }
  end
end
