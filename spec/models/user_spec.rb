require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'association' do

    it{should have_many (:comments)}
    it{should have_many (:posts)}
    it{should have_many (:likes)}
    # it{should has_one (:role)}

  end

end
