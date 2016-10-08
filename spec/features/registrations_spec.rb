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

feature "subscribe" do

  scenario "subscribe in with correct data" do

    expect {
      visit '/pt/subscribe/'

      within("//div[@id='full']") do
        fill_in 'user_name', with: 'Teste'
        fill_in 'user_email', with: 'user@example.com'
        click_button 'Junta-te a nós'
      end
    }.to change{User.count}

    #It Makes possible to look up non visible elements
    Capybara.ignore_hidden_elements = false

    expect(page).to have_content 'Obrigado por se juntar a nós'
  end
end
