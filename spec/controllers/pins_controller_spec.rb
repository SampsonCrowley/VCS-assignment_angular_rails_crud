require 'rails_helper'

RSpec.describe PinsController, type: :controller do

  let(:user){ create(:user) }
  let(:pin){ create(:pin, user: user) }
  let(:unauth_pin){ create(:pin) }

  before do
    FactoryGirl.create_list(:pin, 10)
    sign_in user
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

      resp = JSON.parse(response.body)

      expect(resp).to be_a(Hash)
      expect(resp).to eq(JSON.parse(Pin.second.to_json))
    end
  end

  describe 'POST #create' do
    it_has_behavior 'valid_create', :pin, 1
    it_has_behavior 'invalid_create', :pin, { pin: { item_name: '' } }
  end

  describe 'PATCH #update' do
    it_has_behavior 'valid_update', :pin, { item_name: 'new_name' } do
      let(:checked) { pin }
    end

    it_has_behavior 'invalid_update', :pin, { item_name: '', purchase: nil } do
      let(:checked) { pin }
    end

    it_has_behavior 'unauthorized_update', :pin, { item_name: '', purchase: nil } do
      let(:checked) { create(:pin) }
    end
  end

  describe 'DELETE #destroy' do
    before do
      pin
    end

    it 'deletes a user\'s pin' do
      expect{process :destroy, params: {id: pin.id}}.to change(Pin, :count).by(-1)

      resp = JSON.parse(response.body)
      expect(resp).to eq(JSON.parse(pin.to_json))
      assert_response :success
    end

    context 'Unauthorized' do
      before do
        unauth_pin
      end

      it 'does not change the Pin count' do

        expect{process :destroy, params: {id: unauth_pin.id}}.to_not change(Pin, :count)

      end

      it "should return an unprocessable entity status" do
        process :destroy, params: {id: unauth_pin.id}

        assert_response :unprocessable_entity
      end
    end

  end


end
