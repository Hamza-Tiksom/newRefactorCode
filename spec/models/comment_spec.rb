require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'association'  do
    it{should belongs_to (:post)}
    it{should belongs_to (:user)}
  end

end
