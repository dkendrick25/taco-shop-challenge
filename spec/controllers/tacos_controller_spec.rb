require 'rails_helper'

RSpec.describe TacosController, type: :controller do
  describe "GET 'index'" do
    it 'returns a successful response' do
      create(:taco)
      get :index, format: :json
      expect(response).to be_success
    end
    
    it 'returns tacos' do
      create(:taco)
      get :index, format: :json
      expect(response.body).to include("salsa")
    end
  end
  
  describe "POST 'create'" do
    it 'returns a successful response' do
      post :create, params: { taco: { meat: 'steak', rice: true} }
      expect(response).to be_success
    end
    
    it 'returns a taco' do
      post :create, params: { taco: { meat: 'steak', rice: true} }
      expect(response.body).to include('id')
    end
  end
  
  describe "DESTROY Taco" do
    let(:taco) { create(:taco) }
    it 'returns a successful response' do
      delete :destroy, params: { id: taco.id }
      expect(response).to be_success
    end
    
    it 'deletes taco' do
      delete :destroy, params: { id: taco.id }
      expect(Taco.all).to eq([])
    end
  end
end