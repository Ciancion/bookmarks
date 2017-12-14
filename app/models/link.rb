require "data_mapper"
class Link
  include DataMapper::Resource
  property :id, Serial
  property :link_name, String
  property :link_url, String

  has n, :tags, :through => Resource

   def self.start(name, url, tags_name, tag_class: Tag)
       some_tags =tags_name.map{|tag_name| create_tag(tag_name, tag_class)}

       link = create(link_name: name, link_url: url)

       link.tags += some_tags
       link.save
   end



   def self.filter(tag_name)
     all.select do |link|
       link.tags.map{|tag| tag.tag_name}.include?(tag_name)
     end
   end

 private
    def self.create_tag tag_name, tag_class
      if (tag = tag_class.all.select{|tag| tag_name == tag.tag_name}) == []
        tag = tag_class.create(tag_name: tag_name)
      else
        tag = tag.first
      end
    end

end
