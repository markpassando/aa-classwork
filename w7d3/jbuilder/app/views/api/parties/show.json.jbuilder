json.extract! @party, :name, :location

json.guests do
  json.partial! 'api/guests/guest', collection: @party.guests, as: :guest
end
