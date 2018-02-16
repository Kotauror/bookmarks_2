require 'Tag'

describe Tag do
  describe '.all_tags' do
    it 'returns all tags' do
      Tag.add_to_tags("bootcamp")
      tags = Tag.all_tags
      contents = tags.map(&:content)
      expect(contents).to include("bootcamp")
    end
  end

  describe '.add_to_tags' do
    it 'adds a link to the database' do
      Tag.add_to_tags("fun")
      tags = Tag.all_tags
      contents = tags.map(&:content)
      expect(contents).to include ("fun")
    end
  end

end
