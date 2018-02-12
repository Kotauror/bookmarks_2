require 'link'

describe Link do
  describe '#all' do
    it 'returns all bookmarks' do
      expect(subject.all).to eq "Bookmark 1\nBookmark 2\nBookmark 3\n"
    endli
  end

  # describe '#print' do
  #   it 'prints the array elements' do
  #     expect(subject.print).to eq "Bookmark 1\nBookmark 2\nBookmark 3\n"
  #   end
  # end
end
