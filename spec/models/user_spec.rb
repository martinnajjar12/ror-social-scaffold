require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'John', email: 'john@example.com', password: 'password') }
  let(:another_user) { User.create(name: 'Jane', email: 'jane@example.com', password: 'password') }
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

  describe 'association with friendships' do
    it { should have_many(:posts) }
  end

  describe 'association with friendships' do
    it { should have_many(:comments) }
  end

  describe 'association with friendships' do
    it { should have_many(:friendships) }
  end

  describe 'association with friendships' do
    it { should have_many(:inverse_friendships) }
  end

  describe 'association with friendships' do
    it { should have_many(:likes) }
  end

  describe 'friends method' do
    it 'returns an array' do
      expect(user.friends).to be_an Array
    end
  end

  describe 'pending_friends method' do
    it 'returns an array' do
      expect(user.pending_friends).to be_an Array
    end
  end

  describe 'friend_requests method' do
    it 'returns an array' do
      expect(user.friend_requests).to be_an Array
    end
  end

  describe 'friend? method' do
    it 'returns boolean' do
      expect(user.friend?(another_user)).to eql(false)
    end
  end
end
