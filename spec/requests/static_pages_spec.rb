require 'spec_helper'

describe "StaticPages" do
  # describe "GET /static_pages" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get static_pages_index_path
  #     response.status.should be(200)
  #   end
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/'
      expect(page).to have_content('Sample App')
    end
    it "should have the base title" do
      visit '/'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit '/'
      expect(page).not_to have_title('| Home')
    end
  end
end
