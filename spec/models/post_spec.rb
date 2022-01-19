require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }


    it { should have_many(:tags).through(:taggings) }
    it { should have_many(:taggings) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }





  end
end