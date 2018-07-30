class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :update, :destroy]
  # GET /subscriptions
  def index
    @subscriptions = Subscription.all

    render json: @subscriptions
  end

  # GET /subscriptions/1
  def show
    render json: @subscription
  end

  # POST /subscriptions
  def create
    charge_response = first_charge
    if charge_response['error_code'] == nil
      @subscription = Subscription.new(subscription_params)
    end

    if @subscription && @subscription.save
      render_payload :subscription, :subscribe_successful, :ok
    elsif @subscription
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:customer_id, :plan_id, :plan_name, :plan_price, :plan_period, :subscribe_date, :billing, :card_number, :expiration_month, :expiration_year, :cvv, :zip_code, :shipping_address, :payment_token, :expiration_date)
    end
end
