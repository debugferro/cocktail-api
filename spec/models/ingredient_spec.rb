require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:ingredient) { Ingredient.new(name: 'Lemon') }

  it 'is valid with valid attributes' do
    expect(ingredient).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(30) }
    it { should have_many(:doses) }
  end
end
