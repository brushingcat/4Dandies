require 'rails_helper'

describe 'Subscribe with email' do
  it 'Email invalid it should not create user' do
    expect { post user_registration_path, params: {user: {email: "user@invalid"
    }}}.to_not change{User.count}
  end

  it 'Valid Info it should create the user' do
    expect { post user_registration_path, params: {user: {email: "user@invalid.com"
    }}}.to change{User.count}
  end

end
