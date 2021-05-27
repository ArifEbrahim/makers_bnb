# feature 'you cannot book a date outside of host available dates' do
#   scenario 'error thrown when booking unavailble date' do
#     visit('/')
#     fill_in('email', with: 'test@example.com')
#     fill_in('password', with: 'password123')
#     click_button('Sign up')

#     visit('/listings/new')

#     fill_in('address', with: '1 Example road')
#     fill_in('name', with: 'Central London flat')
#     fill_in('description', with: 'Gorgeous two-bedroom flat on Example road')
#     fill_in('price', with: '89.00')
#     fill_in('start_date', with: '2021-08-03')
#     fill_in('end_date', with: '2021-08-14')
#     click_button('List my space')

#     visit('/listing/1/book')
#     expect(Booking.create(start_date: '2021-11-04', listing_id: 1,
#                           guest_id: 1)).to raise_error
#   end
# end
