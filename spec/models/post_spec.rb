require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'association with user' do
    it { should belong_to(:user) }
  end

  describe 'association with comments' do
    it { should have_many(:comments) }
  end

  describe 'association with likes' do
    it { should have_many(:likes) }
  end

  describe 'association with comments' do
    it { should validate_presence_of(:content) }
  end

  describe 'association with comments' do
    it { should validate_length_of(:content) }
  end
end
