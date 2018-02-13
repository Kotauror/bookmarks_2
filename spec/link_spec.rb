require 'link'

describe Link do
  describe '#all' do
    it 'returns all bookmarks' do
      expect(Link.all).to eq(["http://www.makersacademy.com", "http://www.google.com", "http://www.facebook.com"])
    end
  end

  describe '#add' do
    it 'adds a link to the database' do
      Link.add("http://www.hannahhannahhannah.com")
      expect(Link.all).to include "http://www.hannahhannahhannah.com"
    end
  end

end
