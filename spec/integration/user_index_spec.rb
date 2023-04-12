require 'rails_helper'

RSpec.describe 'UsersIndex', type: :system do
  before do
    def reset_pk_sequence!(table_name)
      ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
    end

    reset_pk_sequence!('users')

    @user1 = User.create!(name: 'User1', photo: 'https://example.com/user1-photo.jpg',
                          bio: 'Bio for User1', posts_counter: 2)

    reset_pk_sequence!('posts')

    @post1 = @user1.posts.create!(title: 'Post 1 by User1', text: 'Post 1 by User1', comments_counter: 0,
                                  likes_counter: 0)
    @post2 = @user1.posts.create!(title: 'Post 2 by User1', text: 'Post 2 by User1', comments_counter: 0,
                                  likes_counter: 0)

    @user2 = User.create!(name: 'User2', photo: 'https://example.com/user2-photo.jpg',
                          bio: 'Bio for User2', posts_counter: 1)
    @post3 = @user2.posts.create!(title: 'Post 1 by User2', text: 'Post 1 by User2', comments_counter: 0,
                                  likes_counter: 0)
  end


  after do
    # Clean up created data
    @post1.destroy if @post1.present?
    @post2.destroy if @post2.present?
    @post3.destroy if @post3.present?

    @user1.destroy if @user1.present?
    @user2.destroy if @user2.present?
  end

  it 'displays all users information' do
    # Visit the users index page
    visit users_path

    # Check for the presence of user1 and user2 information
    expect(page).to have_content 'User1'
    expect(page).to have_content 'Number of post: 2'
    expect(page).to have_css("img[src*='https://example.com/user1-photo.jpg']")

    expect(page).to have_content 'User2'
    expect(page).to have_content 'Number of post: 1'
    expect(page).to have_css("img[src*='https://example.com/user2-photo.jpg']")

    # Check if clicking on a user redirects to the user's show page
    find("a[href='#{user_path(@user1)}']").click
    expect(page).to have_current_path user_path(@user1)
  end
end
