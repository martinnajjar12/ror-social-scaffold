require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'association with user' do
    it { should belong_to(:user) }
  end

  describe 'association with comments' do
    it { should belong_to(:post) }
  end

  describe 'association with comments' do
    it { should validate_presence_of(:content) }
  end

  describe 'association with comments' do
    it { should validate_length_of(:content) }
  end
end