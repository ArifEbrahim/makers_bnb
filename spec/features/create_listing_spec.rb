feature "create a listing" do
  scenario "user can post a listing" do
    visit("listings/new")
    fill_in("address", with: "1 Example road")
    click_button("Submit")

    expect(page).to have_content("1 Example road")
  end
end