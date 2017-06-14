json.extract! @poke, :id, :name, :attack, :defense, :poke_type, :moves, :image_url

json.items do
  json.partial! 'api/items/item', collection: @poke.items, as: :item
end
