require 'rails_helper'

RSpec.describe Dose, type: :model do
  let(:cocktail) { Cocktail.new(name: 'Caipirinha', description: 'It is delicious! Take a sip') }
  let(:ingredient) { Ingredient.new(name: 'Lemon') }
  let(:dose) { Dose.new(description: '1kg', cocktail: cocktail, ingredient: ingredient) }

  it 'is valid with valid attributes' do
    expect(dose).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_least(3).is_at_most(10) }
    it { should belong_to(:cocktail) }
    it { should belong_to(:ingredient) }
  end
end
