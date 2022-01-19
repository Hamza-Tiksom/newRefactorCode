require 'rails_helper'

RSpec.describe Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'associations' do
    it {should belongd_to(:user)}
    it {should belongd_to(:resource)}


  end
end
