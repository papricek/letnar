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

end
