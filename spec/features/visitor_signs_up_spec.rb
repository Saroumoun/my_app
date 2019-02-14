require 'spec_helper'

describe "the signup process", type: :feature do
  before :each do
    @user = FactoryBot.create(:user)
  end

  it "signs me in" do
    # on va sur la page de création d'utilisateurs
    visit '/sessions/new'

    # dans le formulaire des sessions, on remplit les données qu'il faut
    within("#session") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    # clik clik
    click_button 'Sign in'

    # la page affichée devrait afficher des bonnes nouvelles
    expect(page).to have_content 'Successfully logged'
  end
end