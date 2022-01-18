class SubscriptionsController < ApplicationController
  def create
    new_sub = Subscription.new(subscription_params)

    if new_sub.save
      render json: { data: new_sub }
    else
      render json: { errors: new_sub.errors }
    end
  end

  def destroy
    sub = Subscription.find(params[:id])

    render status: 204 if sub.destroy
  end

  private

  def subscription_params
    params.permit(:tea_id, :customer_id, :amount)
  end
end
