require 'rails_helper'

RSpec.describe 'Teas', type: :request do
  describe 'GET /teas' do
    it 'returns all teas' do
      Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
      Tea.create!(title: "Oolang", description: "Smoker", tempature: 79.56, brew_time: 90, price_per_gram: 29.00, id: 2)
      Tea.create!(title: "Killer", description: "Kills fast", tempature: 10.56, brew_time: 5, price_per_gram: 1.00, id: 3)

      get '/teas'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data].length).to eq(3)
      expect(json[:data].first).to have_key(:id)
      expect(json[:data].first).to have_key(:title)
      expect(json[:data].first).to have_key(:description)
      expect(json[:data].first).to have_key(:tempature)
      expect(json[:data].first).to have_key(:brew_time)
      expect(json[:data].first).to have_key(:price_per_gram)
    end
  end
end
