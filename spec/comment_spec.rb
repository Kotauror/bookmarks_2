require 'Comment'

describe Comment do
  describe '.all' do
    it 'returns all bookmarks' do
      comments = Comment.all
      texts = comments.map(&:text)
      expect(texts).to include("bootcamp")
    end
  end

  describe '.add' do
    it 'adds a link to the database' do
      Comment.add("Mean comment", "1")
      comments = Comment.all
      texts = comments.map(&:text)
      expect(texts).to include ("Mean comment")
    end
  end

end
