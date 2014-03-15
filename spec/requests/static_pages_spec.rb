require 'spec_archiveer'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end

    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	expect(page).to have_title('Home')
    end
  end

  describe "archive page" do

  	it "should have the content 'Archive'" do
  		visit '/static_pages/archive'
  		expect(page).to have_content('Archive')
  	end

  	it "should have the title 'archive'" do
    	visit '/static_pages/archive'
    	expect(page).to have_title('archive')
    end

  end
  describe "About page" do
  	it "should have the content 'About'" do
  		visit '/static_pages/about'
  		expect(page).to have_content('About')
  	end

  	it "should have the title 'About'" do
    	visit '/static_pages/about'
    	expect(page).to have_title('About')
    end

  end
end
