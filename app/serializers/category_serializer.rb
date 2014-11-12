class CategorySerializer < ActiveModel::Serializer

  attributes :id, :name, :urls, :updated_at

  has_many :contacts, embed: :id, embed_in_root: true

end
