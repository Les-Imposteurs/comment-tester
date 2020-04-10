require 'rails_helper'

RSpec.describe 'Contact Form Submission', type: :feature do
  it 'fills the form and submit' do
    visit('/contact')
    fill_in 'contact_form_submission[email]', with: 'user@example.com'
    fill_in 'contact_form_submission[subject]', with: 'Pour rien'
    fill_in 'contact_form_submission[content]', with: 'Pour rien du tout'

    click_button 'Submit'
    expect(page).to have_content 'Thank you'
  end
  
end
