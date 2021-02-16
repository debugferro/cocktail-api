require 'rails_helper'

RSpec.describe Cocktail, type: :model do
  let(:cocktail) { Cocktail.new(name: 'Caipirinha', description: 'It is delicious! Take a sip') }

  it 'is not valid without a name' do
    cocktail.name = nil
    expect(cocktail).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(cocktail).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(25) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(5).is_at_most(255) }
    it { should have_many(:doses).dependent(:destroy) }
    it { should have_many(:ingredients).through(:doses) }
    it { should have_many(:reviews).dependent(:destroy) }
  end
end
