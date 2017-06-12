require 'spec_helper'

describe "StaticPages" do
  # describe "GET /static_pages" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get static_pages_index_path
  #     response.status.should be(200)
  #   end
  # end
    describe "Static pages" do
      describe "Home page"  do
        it "should have the content 'Sample App'" do
          visit '/static_pages/home'
          expect(page).to have_content('Sample App')
        end
      end

      describe "Help Page" do
        it '帮助页面应该要包含help这个单词' do
          visit '/static_pages/help'
          expect(page).to have_content('help')
        end
      end
      #测试关于页面
      describe "About page" do
        it "should have the content 'About Us'" do
          visit '/static_pages/about'
          expect(page).to have_content('About Us')
        end
      end
      #检查标题是否为指定内容
      describe "title" do
        it "should have the right title" do
          visit '/static_pages/home'
          expect(page).to have_title("Home")
        end
      end
    end
end
