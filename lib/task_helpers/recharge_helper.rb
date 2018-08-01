module RechargeHelper
  def monthly_recharge
    today = Time.now.strftime("%Y-%m-%d")
    past_dates = []
    (1..12).to_a.each do |number|
      past_dates << number.months.ago.strftime("%Y-%m-%d")
    end
    monthversaries = []
    past_dates.each do |past_date|
      matches = Subscription.all.find_by(subscribe_date: past_date, plan_period: "Monthly")
      monthversaries <<  matches unless matches.nil?
    end
    responses = []
    monthversaries.each do |subscription|
      response = recharge_post(subscription)
      responses << response
    end
    return responses
  end

  def recharge_post(subscription)
    authorization = "Token token=" + ENV['FAKEPAY_SECRET']
    url = "https://www.fakepay.io/purchase"
    payload = {"amount": subscription.plan_price,"payment_token": subscription.payment_token}.to_json
    rest_response = RestClient::Request.new(
                method: :post,
                url: url, 
                payload: payload, 
                headers: {content_type: :json, accept: :json, Authorization: authorization}).execute do |response, request, result|
                    JSON.parse(response.to_s)
                end
    return rest_response
  end
end