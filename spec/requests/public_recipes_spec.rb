require 'rails_helper'

RSpec.describe "Public recipes", type: :request do
  describe "index page" do
    it "shows the right content" do
      visit public_recipes_index_path
      sleep(5)
      expect(page).to have_content('PublicRecipes')
    end
  end

end
