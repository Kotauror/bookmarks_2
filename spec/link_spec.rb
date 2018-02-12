require 'link'

describe Link do
  describe '#all' do
    it 'returns all bookmarks' do
      expect(Link.all).to eq(['Bookmark 1', 'Bookmark 2', 'Bookmark 3'])
    end
  end

end
