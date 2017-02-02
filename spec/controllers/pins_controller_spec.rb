require 'rails_helper'

RSpec.describe PinsController, type: :controller do

  before do
    FactoryGirl.create_list(:pin, 10)
    sign_in create(:user)
  end
  describe 'GET #index' do
    it 'returns an array of pins' do
      process :index

      expect(JSON.parse(response.body).length).to eq(Pin.count)
      expect(JSON.parse(response.body)).to eq(JSON.parse(Pin.all.to_json))
    end
  end

  describe 'GET #show' do
    it 'returns a single pin' do
      process :show, params: { id: Pin.second.id }

      pin = JSON.parse(response.body)

      expect(pin).to be_a(Hash)
      expect(pin).to eq(JSON.parse(Pin.second.to_json))
    end
  end

  describe 'POST #create' do 
    it_has_behavior 'valid_create', :pin, 1
    it_has_behavior 'invalid_create', :pin, { pin: { item_name: '' } }
  end

  describe 'PATCH #update' do 
    it_has_behavior 'valid_update', :pin, { pin: { item_name: 'new_name' } } do 
      let(:checked) { create(:pin) }
    end 
  end
end
