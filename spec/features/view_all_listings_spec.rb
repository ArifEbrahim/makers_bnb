feature 'view listings' do
  scenario 'show a list of listings' do
    Listing.create(
      address: '1 example road',
      name: 'Central London flat',
      description: 'Gorgeous two-bedroom flat on Example road',
      price: '89.00',
      start_date: '2021-08-03',
      end_date: '2021-08-14'
    )
    Listing.create(
      address: '2 example road',
      name: 'Central London flat',
      description: 'Gorgeous two-bedroom flat on Example road',
      price: '89.00',
      start_date: '2021-08-03',
      end_date: '2021-08-14'
    )

    visit('/listings')
    expect(page).to have_content('1 example road')
    expect(page).to have_content('2 example road')
  end
end
