feature "create a listing" do
  scenario "user can post a listing" do
    visit("/listings/new")
    fill_in("address", with: "1 Example road")
    fill_in("name", with: "Central London flat")
    fill_in("description", with: "Gorgeous two-bedroom flat on Example road")
    fill_in("price", with: "89.00")
    click_button("Submit")

    expect(page).to have_content("1 Example road")
    expect(page).to have_content("Central London flat")
    expect(page).to have_content("Gorgeous two-bedroom flat on Example road")
    expect(page).to have_content("89.00")
  end
end