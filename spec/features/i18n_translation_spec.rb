# spec/features/home_page_spec.rb
require 'rails_helper'

describe 'Test Language change by Http Header' do
  it 'Recieves Accept-Language="en" and checks if I18n.locale changes', :js => true do
    get root_path, headers: {"Accept-Language" => 'en'}
    expect(I18n.locale).to eq(:en)
  end

  it 'Recieves Accept-Language="pt" and checks if I18n.locale changes', :js => true do
    get root_path, headers: {"Accept-Language" => 'pt-PT'}
    expect(I18n.locale).to eq(:"pt-PT")
  end

  it 'Recieves Accept-Language="cs_CZ" and because translation doesnt exist it goes to :en', :js => true do
    Rails.cache.clear
    get root_path, headers: {"Accept-Language" => 'cs_CZ'}
    expect(I18n.locale).to eq(:en)
  end
end
