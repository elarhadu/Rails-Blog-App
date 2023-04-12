require 'rails_helper'

RSpec.describe 'UserShow', type: :system do
  before do
    @user1 = User.create!(id: 4, name: 'User1', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg',
                          bio: 'Bio for User 4', posts_counter: 1)
    @post1 = @user1.posts.create!(
      title: 'Post 1 by User 4',
      text: 'Post 1 by User4',
      comments_counter: 0,
      likes_counter: 0
    )
    @user2 = User.create!(id: 5, name: 'User2', photo: 'https://my.alfred.edu/zoom/_images/foster-lake.jpg',
                          bio: 'Bio for User2', posts_counter: 1)
    @post2 = @user2.posts.create!(
      title: 'Post1 by User2',
      text: 'Post1 by User2',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  after do
    @post1.destroy if @post1.present?
    @post2.destroy if @post2.present?
    @user1.destroy if @user1.present?
    @user2.destroy if @user2.present?
  end


  it 'displays user show page information' do
    visit user_path(@user1)

    expect(page).to have_content 'User4'
    expect(page).to have_content 'Number of posts: 1'
    expect(page).to have_content 'Bio for User 4'
    expect(page).to have_content 'Post 1 by User 4'
    expect(page).to have_link 'See All Posts', href: user_posts_path(@user1)

    find('.post-info-link', match: :first).click
    expect(page).to have_current_path user_post_path(@user1, @post1)

    puts user_post_path(@user1, @post1)

    visit user_path(@user1)
    click_on 'See All Posts', match: :first
    expect(page).to have_link 'See All Posts', href: user_posts_path(@user1)

    puts "Post1 ID: #{@post1}"
    puts "Current Path: #{page.current_path}"
    puts "Expected Path: #{user_post_path(@user1, @post1)}"
  end
end
