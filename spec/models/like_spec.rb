require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "association" do
    it{should belongs_to (:user)}
    it{should belongs_to (:post)}
  end
end
