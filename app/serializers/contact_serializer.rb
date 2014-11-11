class ContactSerializer < ActiveModel::Serializer

  attributes :id, :name, :urls, :phones, :address, :updated_at

end
