require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @users = [
      User.create(name: 'Elarh', photo: 'https://www.someimageurl.com', bio: 'A Ghanaian Fullstack Developer', posts_counter: 0),
      User.create(name: 'Houda', photo: 'https://www.someimageurl.com', bio: 'A Morrocan Fullstack Developer', posts_counter: 0)
    ]
    visit users_path
  end

  it 'shows the name of all users' do
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'display the profile picture for each user' do
    @users.each do |user|
      expect(page).to have_css("img[src='#{user.photo}']")
    end
  end

  it 'displays number of posts each user has written' do
    @users.each do |user|
      expect(page).to have_content "Number of post: #{user.posts_counter}"
      expect(page).to have_content "Number of post: #{user.posts_counter}"
    end
  end

  it 'redirects to to a users show page when a user is clicked' do
    click_on @users[0].name
    expect(page).to have_current_path user_path(@users[0].id)
  end
end
