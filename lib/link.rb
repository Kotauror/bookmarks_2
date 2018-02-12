class Link

  def initialize
    @link = ['Bookmark 1', 'Bookmark 2', 'Bookmark 3']
  end

  def all
    @link.each do |bookmark|
      print bookmark
    end
  end

end
