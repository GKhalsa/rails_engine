class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name
end

# class ItemSerializer < ActiveModel::Serializer
#   attributes :id, :name, :description#, :uppercase_name
#   attribute :uppercase_name, key: :uname
#   attribute :name, key: :title
#
#   has_many :orders, serializer: ItemOrderSerializer
#
#   def uppercase_name
#     object.name.upcase
#   end
# end
