require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'association' do
    it{should has_many (:post)}
  end

end
