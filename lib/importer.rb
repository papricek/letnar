require 'yaml'

class Importer

  # require Rails.root.join('lib/importer')
  # data = File.open(Rails.root.join("db/data.yml"))
  # importer = Importer.new(data.read)
  # importer.import

  def initialize(data)
    @data = data
  end

  def import
    YAML.load(@data).sort_by { |c| c[:topic] }.each do |category_hash|
      category = Importer::Category.new(category_hash)
      persisted_category = category.import
      category.contacts.each { |contact| contact.import_to(persisted_category) }
    end
  end

  class Category

    attr_accessor :name, :contacts, :urls

    def initialize(hash)
      @name = hash[:topic]
      @contacts = hash[:contacts].map { |contact_hash| Importer::Contact.new(contact_hash) }
      @urls = hash[:url].to_s.split(" ")
    end

    def import
      category = ::Category.find_or_create_by(name: @name)
      category.update(urls: @urls)
      category
    end
  end

  class Contact

    attr_accessor :address, :url, :name, :phone

    def initialize(hash)
      hash.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def phones
      phone.to_s.split(" ")
    end

    def urls
      url.to_s.split(" ")
    end

    def import_to(category)
      contact = ::Contact.find_or_create_by(name: @name, category_id: category.id)
      contact.update(address:  address,
                     urls:     urls,
                     phones:   phones)
    end

  end

end
