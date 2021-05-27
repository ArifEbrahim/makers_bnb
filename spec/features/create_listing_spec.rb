feature 'create a listing' do
  scenario 'user can post a listing' do
    visit('/listings/new')
    fill_in('address', with: '1 Example road')
    fill_in('name', with: 'Central London flat')
    fill_in('description', with: 'Gorgeous two-bedroom flat on Example road')
    fill_in('price', with: '89.00')
    fill_in('start_date', with: '2021-08-03')
    fill_in('end_date', with: '2021-08-14')
    click_button('List my space')

    expect(page).to have_content('1 Example road')
    expect(page).to have_content('Central London flat')
    expect(page).to have_content('Gorgeous two-bedroom flat on Example road')
    expect(page).to have_content('89.00')
    expect(page).to have_content('Available from: 3 August 2021')
    expect(page).to have_content('Available to: 14 August 2021')
  end
end
