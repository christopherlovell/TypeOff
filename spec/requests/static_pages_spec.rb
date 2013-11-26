require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "Should have the content 'Type Off'" do
      visit '/static_pages/home'
      expect(page).to have_content('TypeOff')
    end
  end
  
  describe "Help page" do
    it "Should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
    
  describe "Leaderboard page" do
    it "Should have the content 'Leaderboard' " do
      visit '/static_pages/leaderboard'
      expect(page).to have_content('Leaderboard')
    end
  end
      
end
