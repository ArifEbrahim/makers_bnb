feature "view listings" do
  scenario "show a list of listings" do
    Listing.create("1 example road")
    Listing.create("2 example road")

    visit("/listings")
    expect(page).to have_content("1 example road")
    expect(page).to have_content("2 example road")
  end
end