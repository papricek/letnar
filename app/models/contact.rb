class Contact < ActiveRecord::Base

  belongs_to :category

  after_save :update_coordinates

  private

    def update_coordinates
      return if not address_changed?

      location = Contact.geocoder.locate(address)
      update_columns(latitude: location.latitude, longitude: location.longitude)
    rescue Graticule::AddressError
    end

    def self.geocoder
      @@geocoder ||= Graticule.service(:google).new(Rails.application.secrets.google_api_key)
    end

end
