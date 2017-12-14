def filter(tag_name)
  @links = Link.all
  @links.select do |link|
    link.tags.map{|tag| tag.tag_name}.include(tag_name)
  end

end
