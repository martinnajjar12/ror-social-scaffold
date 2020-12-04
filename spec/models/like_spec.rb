require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'association with user' do
    it { should belong_to(:user) }
  end

  describe 'association with comments' do
    it { should belong_to(:post) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:post_id) }
  end
end