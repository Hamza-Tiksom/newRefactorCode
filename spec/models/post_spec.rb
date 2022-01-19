require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'validations' do
    current_user=User.find_or_create!(email: "tiksom@gmail.com",password: "password",password_confirmation: "password" )
    it 'has a title' do(
      post=Post.new
      title  ''
      body  'A valid body'
      user  current_user
    )
    expect(post).to_not be_valid
    post.title 'A valid title'
    expect(post).to be_valid
    end
    it 'has a body' do(
      post=Post.new
      title  'A valid title'
      body  ''
      user  current_user
    )
    expect(post).to_not be_valid
    post.title 'A valid title'
    expect(post).to be_valid
    end
  end
  context 'association' do
    it { should belongs_to (:user) }
    it { should belongs_to (:category)}

    it{should has_many (:taggings)}
    it{should has_many (:comments)}
    it{should has_many (:likes)}
    it { should has_many(:tags).through(:taggings) }




  end
end
