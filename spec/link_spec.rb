require 'link'

describe Link do
  describe '#all' do
    it 'returns all bookmarks' do
      links = Link.all
      urls = links.map(&:url)
      expect(urls).to include("http://www.makersacademy.com")
      expect(urls).to include("http://www.google.com")
      expect(urls).to include("http://www.facebook.com")
    end
  end

  describe '#add' do
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

end
