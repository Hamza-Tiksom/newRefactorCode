require 'rails_helper'

RSpec.describe Tag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context "association" do
    it{ should belongs_to(:tagging)}
    it{ should has_many (:posts).through (:tagging)}

  end
end
