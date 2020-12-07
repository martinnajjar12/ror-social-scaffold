require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { User.create(name: 'John', email: 'john@example.com', password: 'password') }
  let(:user2) { User.create(name: 'Jane', email: 'jane@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    expect(user1.friendships.build(friend_id: user2.id, confirmed: true)).to be_valid
  end

  it 'is not valid with invalid attributes' do
    expect(user1.friendships.build(friend_id: 100, confirmed: true)).to be_invalid
  end

  describe 'association with friend' do
    it { should belong_to(:friend).class_name('User') }
  end

  describe 'association with user' do
    it { should belong_to(:user) }
  end
end
