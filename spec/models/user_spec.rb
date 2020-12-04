require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'Should create a user' do
    User.create(name: 'john', email: 'john@example.com', password: 'password')
    expect(User.all.count).not_to eq(0)
  end

  it 'Should not create a user without name' do
    user = User.create(email: 'john@example.com', password: 'password')
    expect(user.id).to be nil
  end

  it 'Should not create a user without email' do
    user = User.create(name: 'John', password: 'password')
    expect(user.id).to be nil
  end

  it 'Should not create a user without password' do
    user = User.create(name: 'Jon', email: 'john@example.com')
    expect(user.id).to be nil
  end

  it 'Should create a post' do
    user = User.create(name: 'john', email: 'john@example.com', password: 'password')
    post = user.posts.build(content: 'Hello World!')
    expect(post.user_id).to eql(user.id)
  end

  it 'Can comment to a post' do
    user = User.create(name: 'john', email: 'john@example.com', password: 'password')
    post = user.posts.build(content: 'Hello World!')
    comment = user.comments.build(content: 'I commented on this post', post_id: post.id)
    expect(comment.user_id).to eql(user.id)
  end
end
