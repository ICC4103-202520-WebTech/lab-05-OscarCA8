# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Room.create!(number: "101", room_type: 0, price: 100, status: 0)
Guest.create!(first_name: "Oscar", last_name: "Carrasco", email: "oicarrasco@miuandes.cl", phone: "+5691245679", document_id: "ABCDEF")
Reservation.create!(code: "ABC1000",guest_id: 1, room_id: 1, check_in: Date.today + 1, check_out: Date.today + 3, status: 0, adults: 2, children: 1)
Service.create!(name: "Breakfast", price: 20, is_active: true)
ServiceUsage.create!(reservation_id: 1, service_id: 1, quantity: 2, used_at: DateTime.now - 1, note: "Early morning request")
Invoice.create!(reservation_id: 1, nights_subtotal: 100 * 2, services_subtotal: 20 * 2, tax: 24, total: 264, issued_at: DateTime.now, status: "paid")