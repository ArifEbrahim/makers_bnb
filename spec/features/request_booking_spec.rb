feature 'booking a listing' do
  scenario 'user can see listing details on booking page' do
    listing = Listing.create(
      address: "1 example road", 
      name: "Central London flat", 
      description: "Gorgeous two-bedroom flat on Example road", 
      price: "89.00",
      start_date: '2021-08-03',
      end_date: '2021-08-14')
    visit("/listings/#{listing.id}/book")

    expect(page).to have_content("Central London flat")
    expect(page).to have_content("Gorgeous two-bedroom flat on Example road")
  end
  scenario 'user can select date and make booking request' do
    listing = Listing.create(
      address: "1 example road", 
      name: "Central London flat", 
      description: "Gorgeous two-bedroom flat on Example road", 
      price: "89.00",
      start_date: '2021-08-03',
      end_date: '2021-08-14')
    visit("/listings/#{listing.id}/book")
    fill_in('start_date', with: '05/08/2021')
    click_button('Submit')

    expect(page).to have_content("Thank you for your booking request")
  end
end