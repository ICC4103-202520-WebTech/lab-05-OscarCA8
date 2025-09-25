# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
room = Room.find_or_create_by!(number: "101") do |r|
  r.room_type = 0
  r.price = 100
  r.status = 0
end

guest = Guest.find_or_create_by!(email: "oicarrasco@miuandes.cl") do |g|
  g.first_name = "Oscar"
  g.last_name = "Carrasco"
  g.phone = "+5691245679"
  g.document_id = "ABCDEF"
end

reservation = Reservation.find_or_create_by!(code: "ABC1000") do |res|
  res.guest = guest
  res.room = room
  res.check_in = Date.today + 1
  res.check_out = Date.today + 3
  res.status = 0
  res.adults = 2
  res.children = 1
end

service = Service.find_or_create_by!(name: "Breakfast") do |s|
  s.price = 20
  s.is_active = true
end

ServiceUsage.find_or_create_by!(reservation: reservation, service: service, used_at: DateTime.now - 1) do |su|
  su.quantity = 2
  su.note = "Early morning request"
end

Invoice.find_or_create_by!(reservation: reservation) do |inv|
  nights = (reservation.check_out - reservation.check_in).to_i
  inv.nights_subtotal = room.price * nights
  inv.services_subtotal = service.price * 2
  inv.tax = 24
  inv.total = inv.nights_subtotal + inv.services_subtotal + inv.tax
  inv.issued_at = DateTime.now
  inv.status = "paid"
end
