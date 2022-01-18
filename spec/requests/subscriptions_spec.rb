require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  describe "POST /subscriptions" do
    describe 'Happy Path' do
      it 'will return the new subscription created' do
        Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
        Customer.create!(first_name: "Bird", last_name: "Man", email: "bird@gmail.com", address: "123 Avenue Way", id: 1)
        post '/subscriptions', params: { customer_id: 1, tea_id: 1 , amount: 1 }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to have_key(:data)
        expect(json[:data]).to have_key(:id)
        expect(json[:data]).to have_key(:title)
        expect(json[:data]).to have_key(:price)
        expect(json[:data]).to have_key(:status)
        expect(json[:data]).to have_key(:frequency)
        expect(json[:data]).to have_key(:tea_id)
        expect(json[:data]).to have_key(:customer_id)
        expect(json[:data]).to have_key(:amount)
        expect(json[:data]).to have_key(:created_at)
        expect(json[:data]).to have_key(:updated_at)
      end
    end

    describe 'Sad Path' do
      it 'will return an error for an incorrect customer' do
        Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
        Customer.create!(first_name: "Bird", last_name: "Man", email: "bird@gmail.com", address: "123 Avenue Way", id: 1)

        post '/subscriptions', params: { customer_id: 4, tea_id: 1 , amount: 1 }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to have_key(:errors)
        expect(json[:errors]).to have_key(:customer)
      end

      it 'will return an error for an incorrect tea' do
        Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
        Customer.create!(first_name: "Bird", last_name: "Man", email: "bird@gmail.com", address: "123 Avenue Way", id: 1)

        post '/subscriptions', params: { customer_id: 1, tea_id: 4, amount: 1 }

        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to have_key(:errors)
        expect(json[:errors]).to have_key(:tea)
      end
    end
  end

  describe 'DELETE /subscriptions' do
    describe 'Happy Path' do
      it 'will return the successful status code after deletion' do
        Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
        Customer.create!(first_name: "Bird", last_name: "Man", email: "bird@gmail.com", address: "123 Avenue Way", id: 1)
        sub = Subscription.create!(tea_id: 1, customer_id: 1, amount: 3)

        delete "/subscriptions/#{sub.id}"

        expect(response.status).to eq(204)
      end
    end

    describe 'Sad Path' do
      it 'will return an error if subscription does not exist' do
        Tea.create!(title: "Dogma", description: "Really cool man", tempature: 45.56, brew_time: 12, price_per_gram: 2.00, id: 1)
        Customer.create!(first_name: "Bird", last_name: "Man", email: "bird@gmail.com", address: "123 Avenue Way", id: 1)
        sub = Subscription.create!(tea_id: 1, customer_id: 1, amount: 3)

        expect { delete "/subscriptions/90000" }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
