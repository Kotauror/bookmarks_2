require 'Tag'

describe Tag do
  describe '.all' do
    it 'returns all tags' do
      tags = Tag.all
      contents = tags.map(&:content)
      expect(contents).to include("bootcamp")
    end
  end

  describe '.add_to_tags' do
    it 'adds a link to the database' do
      Tag.add_to_tags("fun")
      tags = Tag.all
      contents = tags.map(&:content)
      expect(contents).to include ("fun")
    end
  end

end
