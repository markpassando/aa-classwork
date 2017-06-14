json.extract! guest, :name, :age, :favorite_color

json.gifts do
  json.partial! 'api/gifts/gift', collection: guest.gifts, as: :gift
end
