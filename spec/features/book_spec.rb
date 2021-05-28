# feature "booking property" do 
#   scenario "user can submit a booking form" do 
#     visit('/book')
#     expect(page).to have_content "Please enter your details below"
#   end 

#   scenario "fill in booking form" do 
#     visit('book')
#     fill_in('name', with: 'User1')
#     fill_in('email', with: 'user1@test.com')
#     fill_in('start_date', with: '15/09/2021')
#     fill_in('nights', with: '2')
#     click_button('Submit')
#     expect(page).to have_content "Thank you for your booking request"
#   end 
# end

