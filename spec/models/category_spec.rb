require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Associations' do
    it 'has_many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq :has_many
    end
  end
end


#These are alternative ways to write the same specs, previously these specs failed
#So I found another way to write them. Once they passed, all my specs passed.
# RSpec.describe Category, type: :model do
#   context 'Associations' do
#       it { should_have_many(:posts) }
#     it 'has_many posts' do
#       association = described_class.reflect_on_association(:posts)
#       expect(association.macro).to eq :has_many
#     end
#   end
#
#
# RSpec.describe Category, type: :model do
#     context 'Associations' do
#       it 'should have many posts' do
#         subject { described_class.new }
#         assc = described_class.reflect_on_association(:posts)
#         expect(assc.macro).to eq :has_many
#       end
#     end
#   end
