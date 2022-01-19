require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context 'association' do

    it{should has_many (:comments)}
    it{should has_many (:posts)}
    it{should has_many (:likes)}
    it{should has_one (:role)}

  end

end
