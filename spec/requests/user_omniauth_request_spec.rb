require 'spec_helper'

describe 'Login with Omniauth' do

  before(:each) do
    @email=""
  end

  it "Invalid User Info it should be invalid" do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        {
            provider: "google_oauth2",
            uid: '123545',
            info: {
                first_name: "Gaius",
                last_name: "Baltar",
                email: @email,
                image_url: "image.com"
            },
            credentials: {
                token: "123456",
                expires_at: Time.now + 1.week
            },
            extra: {
                raw_info: {
                    gender: 'male'
                }
            }
        })

    expect { get "/users/auth/google_oauth2/callback" }.to_not change { User.count }
  end
end

describe 'Login with Google' do

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:google_oauth2] = createAutoHash

    expect { get "/users/auth/google_oauth2/callback" }.to change { User.count }

    # request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    #auth=request.env["omniauth.auth"]
    #user = User.find_by_email(auth.info.email)
    #expect(user).not_to be_nil
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    expect { silence_omniauth { get "/users/auth/google_oauth2/callback" } }.to_not change { User.count }
  end
end

describe 'Login with Facebook' do

  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:facebook] = createAutoHash
    expect { get "/users/auth/facebook/callback" }.to change { User.count }
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    expect { silence_omniauth { get "/users/auth/facebook/callback" } }.to_not change { User.count }
  end
end

describe 'Login with Twitter' do
  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:twitter] = createAutoHash("twitter")
    expect { get "/users/auth/twitter/callback" }.to change { User.count }
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
    expect { silence_omniauth { get "/users/auth/twitter/callback" } }.to_not change { User.count }
  end
end

describe 'Login with Instagram' do
  it "Valid credentials it should be valid" do
    OmniAuth.config.mock_auth[:instagram] = createAutoHash("instagram")
    expect { get "/users/auth/instagram/callback" }.to change { User.count }
  end

  it "Invalid credentials it should be invalid" do
    OmniAuth.config.mock_auth[:instagram] = :invalid_credentials
    expect { silence_omniauth { get "/users/auth/instagram/callback" } }.to_not change { User.count }
  end
end