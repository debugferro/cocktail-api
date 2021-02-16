require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:cocktail) { Cocktail.new(name: 'Caipirinha', description: 'It is delicious! Take a sip') }
  let(:review) { Review.new(username: 'user', rate: 5, content: 'I loved it!', cocktail: cocktail) }

  it "is expected to when username is empty, username should include 'Anonymous' to it" do
    review.username = ''
    expect(review.username).to include(/Anonymous/)
  end

  it 'is expected to be invalid when cocktail is not an instance of Cocktail' do
    review.cocktail = ''
    expect(cocktail).to_not be_valid
  end

  describe 'Validations' do
    it { should have_one(:cocktail) }
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(5).is_at_most(255) }
    it { should validate_length_of(:username).is_at_least(3).is_at_most(25) }
    it {
      should validate_numericality_of(:rate)
        .only_integer.is_less_than_or_equal_to(5).is_greater_than_or_equal_to(0)
    }
  end
end
