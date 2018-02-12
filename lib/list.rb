class List

  def initialize
    @list = ['Bookmark 1', 'Bookmark 2', 'Bookmark 3']
  end

  def all
    @list.each do |bookmark|
      print bookmark
    end
  end

end
