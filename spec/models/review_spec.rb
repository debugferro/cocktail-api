require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:cocktail) { Cocktail.new(name: 'Caipirinha', description: 'It is delicious! Take a sip') }
  let(:review) { Review.new(username: 'user', rate: 5, content: 'I loved it!', cocktail: cocktail) }

  describe 'set_username callback' do
    it "is expected to when username is empty, username should match 'Anonymous' in it" do
      review.username = ''
      review.valid?
      expect(review.username).to match(/Anonymous/)
    end

    it 'triggers set_username on before validations' do
      expect(review).to receive(:set_username)
      review.valid?
    end
  end

  describe 'Validations' do
    it { should belong_to(:cocktail) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(5).is_at_most(255) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(25) }
    it {
      should validate_numericality_of(:rate)
        .only_integer.is_less_than_or_equal_to(5).is_greater_than_or_equal_to(0)
    }
  end
end
