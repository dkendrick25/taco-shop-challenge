require 'rails_helper'

RSpec.describe Taco, type: :model do
  let(:taco) { build_stubbed(:taco) }
  
  describe 'validations' do
    context 'valid' do
      it 'is valid with valid attributes' do
        expect(taco).to be_valid
      end
    end
    
    context 'invalid' do
      it 'is not valid without a meat' do
        taco.meat = nil
        expect(taco).to_not be_valid
      end
    end
  end
end