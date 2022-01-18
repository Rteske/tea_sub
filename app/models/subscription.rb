class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  validates_associated :tea, :customer
  validates_presence_of :amount

  after_save :generate_subscription, on: :create

  private

  def generate_subscription
    self.frequency = DateTime.now
    self.price = self.amount * self.tea.price_per_gram
    self.title = self.customer.first_name + self.tea.title + self.amount.to_s
  end
end
