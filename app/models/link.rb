require "data_mapper"
class Link
  include DataMapper::Resource
  property :id, Serial
  property :link_name, String
  property :link_url, String

  has n, :tags, :through => Resource

   def self.start(name, url, tag_name, tag_class: Tag)

     if (tag = tag_class.all.select{|tag| tag_name == tag.tag_name}) == []
       tag = tag_class.create(tag_name: tag_name)
     else
       tag = tag.first
     end
       link = create(link_name: name, link_url: url)
       link.tags << tag
       link.save
       p link.tags
   end

   def self.filter(tag_name)
     all.select do |link|
       link.tags.map{|tag| tag.tag_name}.include?(tag_name)
     end
   end

end
