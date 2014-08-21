class Category

  attr_accessor :topic, :contacts, :facebook_urls

  def initialize(attributes)
    @topic = attributes[:topic]
    @contacts = attributes[:contacts].map { |c| Contact.new(c) }
    @facebook_urls = attributes[:url].to_s.split(" ")
  end

  def self.by_topic
    YAML.load_file(Rails.root.join('db/data.yml')).
      sort_by{ |c| c[:topic] }.
      map{|c| Category.new(c) }
  end

end
