require 'spec_helper'


describe 'Login with Google' do

  before(:each) do
    OmniAuth.config.test_mode = true
    @user = User.first
  end

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:google_oauth2] = createAutoHash

    get "/users/auth/google_oauth2/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    @user = User.first
    @user.should_not be_nil
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

    get "/users/auth/google_oauth2/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    @user = User.first
    @user.should be_nil

  end
end

describe 'Login with Facebook' do

  before(:each) do
    OmniAuth.config.test_mode = true
    @user = User.first
  end

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:facebook] = createAutoHash

    get "/users/auth/facebook/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]

    @user = User.first
    @user.should_not be_nil
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials

    get "/users/auth/facebook/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]

    @user = User.first
    @user.should be_nil

  end
end

describe 'Login with Twitter' do

  before(:each) do
    OmniAuth.config.test_mode = true
    @user = User.first
  end

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:twitter] = createAutoHash("twitter")

    get "/users/auth/twitter/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

    @user = User.first
    @user.should_not be_nil
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials

    get "/users/auth/twitter/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]

    @user = User.first
    @user.should be_nil

  end
end

describe 'Login with Instagram' do

  before(:each) do
    OmniAuth.config.test_mode = true
    @user = User.first
  end

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:instagram] = createAutoHash("instagram")

    get "/users/auth/instagram/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]

    @user = User.first
    @user.should_not be_nil
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:instagram] = :invalid_credentials

    get "/users/auth/instagram/callback"

    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:instagram]

    @user = User.first
    @user.should be_nil

  end
end