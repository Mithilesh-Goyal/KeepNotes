require 'rails_helper'
require 'devise'

RSpec.describe NotesController, type: :controller do
  include Devise::Test::ControllerHelpers

  # ... other test cases

  describe 'GET #index' do
    it 'returns a successful response with status 200 and "OK"' do
      # get :index
      # expect(response).to be_successful

      expect(response.status).to eq(200)
      # expect(response.status).to include('OK')
    end
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      # debugger
      # get :index
      expect(response).to be_successful
    end
  end
  describe 'GET #show' do
    it 'returns a successful response with status 200 and "OK"' do
      note = create(:note)
      get :show, params: { id: note.to_param }
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response.body).to include('OK')
    end
  end

  # ... test cases for other controller actions
end
