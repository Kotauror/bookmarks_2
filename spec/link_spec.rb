require 'link'

describe Link do
  describe '.all' do
    it 'returns all bookmarks' do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe '.add' do
    it 'adds a link to the database' do
      Link.add("http://www.hannahhannahhannah.com", "Hannah")
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include "http://www.hannahhannahhannah.com"
    end

    it 'only creates link if the URL is valid' do
      Link.add('TEST', 'TEST')
      expect(Link.all).not_to include 'TEST'
    end
  end

  describe '.delete' do
    it 'deletes row from database' do
      Link.delete('Google')
      links = Link.all
      titles = links.map(&:title)
      expect(titles).not_to include 'Google'
    end
  end

  describe '.update' do
    it 'updates a row in the database' do
      Link.update('Google', 'Search Engine', 'http://www.google.com')
      links = Link.all
      titles = links.map(&:title)
      expect(titles).to include 'Search Engine'
    end
  end
  # 
  # describe '.store_title' do
  #   it 'stores a title' do
  #     Link.store_title("Google")
  #
  #   end
  # end

end
